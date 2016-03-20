//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class FavoritesFlowWireframe {

  func favoritePlacesModule() -> FavoritePlacesModule {
    let identifier = FavoritesViewControllersIdentifiers.FavoritePlaces
    let viewController = storyboard().instantiateViewControllerWithIdentifier(identifier) as! FavoritePlacesViewController
    let presenter = FavoritePlacesPresenter()
    let interactor = FavoritePlacesInteractor()
    let router = FavoritePlacesRouter(withWireframe: FavoritesFlowWireframe())
    return try! moduleWithType(FavoritePlacesModule.self, presenter: presenter, view: viewController,
                               interactor: interactor, router: router)
  }

  private func storyboard() -> UIStoryboard {
    return UIStoryboard(name: "Favorites", bundle: nil)
  }

}

extension FavoritesFlowWireframe: FavoritePlacesWireframe {}
