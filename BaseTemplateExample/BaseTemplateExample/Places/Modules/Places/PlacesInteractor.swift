//
//  PlacesInteractor.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import CoreLocation

class PlacesInteractor: BaseInteractor {
  typealias PresenterType = PlacesPresenting
  weak var presenter: PlacesPresenting!
  private let placesService: PlacesFetching
  private let locationService: LocationProvider
  var radius: Int = 1500 //meters

  init(withPlacesService placesService: PlacesFetching, locationService: LocationProvider) {
    self.placesService = placesService
    self.locationService = locationService
  }

}

extension PlacesInteractor: PlacesInteracting {

  func fetchPlaces(forCategory category: Category?, withSearchString searchString: String?) {
    locationService.getLocation(success: {
      [weak self] location in
      self?.fetchPlaces(nearLocation: location, forCategory: category, withSearchString: searchString)
    }, failure: {
      [weak self] errorMessage in
      self?.presenter.processPlacesFetchFail(withErrorMessage: errorMessage)
    })
  }

  private func fetchPlaces(nearLocation location: CLLocation, forCategory category: Category?,
                           withSearchString searchString: String?) {
    placesService.getPlaces(nearLocation: location, inRadius: radius, forCategory: category,
                            withSearchString: searchString, success: {
      [weak self] places in
      self?.presenter.presentPlaces(places, forCategory: category, searchString: searchString)
    }, failure: {
      [weak self] errorMessage in
      self?.presenter.processPlacesFetchFail(withErrorMessage: errorMessage)
    })
  }

}

typealias PlacesClosure = [Place]? -> Void
protocol PlacesFetching {
  func getPlaces(nearLocation location: CLLocation, inRadius radius: Int, forCategory category: Category?,
                 withSearchString searchString: String?, success: PlacesClosure?, failure: FailureClosure?)
}

typealias LocationSuccessClosure = CLLocation -> Void
typealias LocationFailureClosure = String -> Void
protocol LocationProvider {
  func getLocation(success success: LocationSuccessClosure?, failure: LocationFailureClosure?)
}