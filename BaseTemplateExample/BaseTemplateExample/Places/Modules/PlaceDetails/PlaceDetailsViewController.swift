//
//  PlaceDetailsViewController.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class PlaceDetailsViewController: UIViewController, BaseView {
  var eventHandler: PlaceDetailsEventHandler!
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var countryLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var phoneLabel: UILabel!
  var place: Place?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureInterface()
  }
  
  //MARK: Interface
  fileprivate func configureInterface() {
    configureMapView()
    if let place = place {
      configureInterfaceWithPlace(place)
    }
  }

  fileprivate func configureMapView() {
    mapView.showsScale = true
    mapView.showsUserLocation = true
    mapView.delegate = self
  }
  
  fileprivate func configureInterfaceWithPlace(_ place: Place) {
    title = place.name
    nameLabel.text = place.name
    countryLabel.text = place.country
    cityLabel.text = place.city
    addressLabel.text = place.address
    phoneLabel.text = place.phone
    showPlaceOnMap(place)
  }
  
  fileprivate func showPlaceOnMap(_ place: Place) {
    if let latitude = place.lat, let longitude = place.lng {
      let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
      let region = MKCoordinateRegionMakeWithDistance(center, 500, 300)
      mapView.setRegion(region, animated: true)
      let annotation = MKPointAnnotation()
      annotation.coordinate = center
      mapView.addAnnotation(annotation)
    }
  }

}

extension PlaceDetailsViewController: PlaceDetailsViewing {

  func showPlace(_ place: Place) {
    self.place = place
    if isViewLoaded {
      configureInterfaceWithPlace(place)
    }
  }

}

extension PlaceDetailsViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    return nil
  }
}
