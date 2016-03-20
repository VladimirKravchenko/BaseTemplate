//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import CoreLocation

typealias LocationUpdateClosure = CLLocation -> Void
typealias LocationUpdateFailClosure = NSError -> Void
typealias LocationStatusChangeClosure = CLAuthorizationStatus -> Void

class LocationService: NSObject {
  private var locationUpdateClosure: LocationUpdateClosure?
  private var locationUpdateFailClosure: LocationUpdateFailClosure?
  private var locationStatusChangeClosure: LocationStatusChangeClosure?
  private lazy var locationManager: CLLocationManager = {
    let manager = CLLocationManager()
    manager.delegate = self
    manager.requestWhenInUseAuthorization()
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.distanceFilter = 50
    return manager
  }()

  override init() {
    super.init()
    locationManager.delegate = self
  }

}

protocol LocationManaging {
  var location: CLLocation? {get}
  func startUpdatingLocation()
  func stopUpdatingLocation()
}

extension LocationService: LocationManaging {

  var location: CLLocation? {
    return locationManager.location
  }

  func startUpdatingLocation() {
    locationManager.startUpdatingLocation()
  }

  func stopUpdatingLocation() {
    locationManager.stopUpdatingLocation()
  }

}

extension LocationService: CLLocationManagerDelegate {

  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.last {
      print("Location was changed: \(location.coordinate.latitude):\(location.coordinate.longitude)")
      locationUpdateClosure?(location)
    }
  }

  func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
    print("Location service authorization status was changed: \(status)")
    locationStatusChangeClosure?(status)
  }

  func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    print("Location manager did fail with error: \(error)")
    locationUpdateFailClosure?(error)
  }

}

extension LocationService: LocationProvider {
  func getLocation(success success: LocationSuccessClosure?, failure: LocationFailureClosure?) {
    locationUpdateClosure = {
      [weak self] location in
      self?.locationUpdateClosure = nil
      success?(location)
    }
    locationUpdateFailClosure = {
      [weak self] error in
      self?.locationUpdateFailClosure = nil
      failure?(self?.messageForError(error) ?? "Unknown location service error")
    }
    locationManager.requestLocation()
  }

  private func messageForError(error: NSError) -> String {
    if error.domain == kCLErrorDomain && CLError(rawValue: error.code) == .Denied {
      return "Location service was denied. Please allow location access in settings"
    } else {
      return "Unknown location service error"
    }

  }

}
