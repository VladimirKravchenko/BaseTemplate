//
//  FavoritePlacesPresenter.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

class FavoritePlacesPresenter: BasePresenter {
  typealias ViewType = FavoritePlacesView
  weak var delegate: FavoritePlacesDelegate?
  weak var view: FavoritePlacesView!
  var interactor: FavoritePlacesInteracting!
  var router: FavoritePlacesRouting!
}

extension FavoritePlacesPresenter: FavoritePlacesConfigurator {
}

extension FavoritePlacesPresenter: FavoritePlacesPresenting {
}

extension FavoritePlacesPresenter: FavoritePlacesEventHandler {
}
