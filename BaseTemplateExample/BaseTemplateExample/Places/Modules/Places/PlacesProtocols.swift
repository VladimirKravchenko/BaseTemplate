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
  func fetchPlaces(forCategory category: Category?, withSearchString: String?)
}

protocol PlacesPresenting: class {
  func presentPlaces(places: [Place]?)
  func processPlacesFetchFail(withErrorMessage message: String?)
}

protocol PlacesView: class {
  func showPlaces(places: [Place]?)
}

protocol PlacesEventHandler: class {
  func handleSearchForString(string: String)
  func handleRefreshEvent()
  func handleCategorySelection()
  func handlePlaceSelection(place: Place)
}

protocol PlacesRouting: class {
  func openCategorySelection()
  func closeCategorySelection()
  func openDetailsForPlace(place: Place)
  func closePlaceDetails()
}

protocol PlacesWireframe: class {
  func categorySelectionModule() -> CategorySelectionModule
  func placeDetailsModule() -> PlaceDetailsModule
}
