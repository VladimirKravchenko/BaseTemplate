//
//  PlacesProtocols.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

protocol PlacesConfigurator: class {
  weak var delegate: PlacesDelegate? {get set}
}

protocol PlacesDelegate: class {
}

protocol PlacesInteracting: class {
  func requestPlaces(forCategory category: Category?, withSearchString searchString: String?)
}

protocol PlacesPresenting: class {
  func presentPlaces(_ places: [Place]?, forCategory category: Category?, searchString: String?)
  func processPlacesRequestFail(withErrorMessage message: String?)
}

protocol PlacesViewing: class {
  func showPlaces(_ places: [Place]?)
  func showCategoryName(_ name: String?)
  func showLoadingIndicators()
  func hideLoadingIndicators()
}

protocol PlacesEventHandler: class {
  func handleSearchForString(_ string: String)
  func handleRefreshEvent()
  func handleCategorySelection()
  func handlePlaceSelection(_ place: Place)
}

protocol PlacesRouting: class {
  func openCategorySelection()
  func closeCategorySelection()
  func openDetailsForPlace(_ place: Place)
  func closePlaceDetails()
}

protocol PlacesWireframe: class {
  func categorySelectionModule() -> CategorySelectionModule
  func placeDetailsModule() -> PlaceDetailsModule
}
