//
//  FavoritePlacesInteractor.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

class FavoritePlacesInteractor: BaseInteractor {
  typealias PresenterType = FavoritePlacesPresenting
  weak var presenter: FavoritePlacesPresenting!
}

extension FavoritePlacesInteractor: FavoritePlacesInteracting {
}
