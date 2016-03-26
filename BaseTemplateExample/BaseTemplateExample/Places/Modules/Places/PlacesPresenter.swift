//
//  PlacesPresenter.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class PlacesPresenter: BasePresenter {
  typealias ViewType = PlacesViewing
  weak var delegate: PlacesDelegate?
  weak var view: PlacesViewing!
  var interactor: PlacesInteracting!
  var router: PlacesRouting!
  var searchString: String?
  var selectedCategory: Category?
}

extension PlacesPresenter: PlacesConfigurator {
}

extension PlacesPresenter: PlacesPresenting {

  func presentPlaces(places: [Place]?, forCategory category: Category?, searchString: String?) {
    guard category == selectedCategory && searchString == self.searchString else {
      return
    }
    view.showPlaces(places)
  }

  func processPlacesRequestFail(withErrorMessage message: String?) {
    view.hideLoadingIndicators()
    if let message = message {
      UIAlertController.showMessage(message)
    }
  }

}

extension PlacesPresenter: PlacesEventHandler {

  func handleSearchForString(string: String) {
    searchString = string
    interactor.requestPlaces(forCategory: selectedCategory, withSearchString: searchString)
  }

  func handleRefreshEvent() {
    interactor.requestPlaces(forCategory: selectedCategory, withSearchString: searchString)
  }

  func handleCategorySelection() {
    router.openCategorySelection()
  }

  func handlePlaceSelection(place: Place) {
    router.openDetailsForPlace(place)
  }

}

extension PlacesPresenter: CategorySelectionDelegate {

  func updateForSelectedCategory(category: Category) {
    router.closeCategorySelection()
    selectedCategory = category
    view.showCategoryName(category.name)
    view.showLoadingIndicators()
    interactor.requestPlaces(forCategory: selectedCategory, withSearchString: searchString)
  }

}
