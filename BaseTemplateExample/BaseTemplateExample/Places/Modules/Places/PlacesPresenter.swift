//
//  PlacesPresenter.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

class PlacesPresenter: BasePresenter {
  typealias ViewType = PlacesView
  weak var delegate: PlacesDelegate?
  weak var view: PlacesView!
  var interactor: PlacesInteracting!
  var router: PlacesRouting!
  var searchString: String?
  var selectedCategory: Category?
}

extension PlacesPresenter: PlacesConfigurator {
}

extension PlacesPresenter: PlacesPresenting {

  func presentPlaces(places: [Place]?) {
    view.showPlaces(places)
  }

  func processPlacesFetchFail(withErrorMessage message: String?) {
  }

}

extension PlacesPresenter: PlacesEventHandler {

  func handleSearchForString(string: String) {
    searchString = string
    interactor.fetchPlaces(forCategory: selectedCategory, withSearchString: searchString)
  }

  func handleRefreshEvent() {
    interactor.fetchPlaces(forCategory: selectedCategory, withSearchString: searchString)
  }

  func handleCategorySelection() {
    router.openCategorySelection()
  }

  func handlePlaceSelection(place: Place) {
    router.openDetailsForPlace(place)
  }

}
