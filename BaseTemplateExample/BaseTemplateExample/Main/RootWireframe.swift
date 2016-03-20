//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class RootWireframe {
  lazy var tabBarController: TabBarController = {
    let placesModule = PlacesFlowWireframe().placesModule()
    let placesViewController = UINavigationController(rootViewController: placesModule.viewController)
    let favoritesModule = FavoritesFlowWireframe().favoritePlacesModule()
    let favoritesViewController = UINavigationController(rootViewController: favoritesModule.viewController)
    let tabBarController = TabBarController()
    tabBarController.viewControllers = [placesViewController, favoritesViewController]
    placesViewController.tabBarItem.title = "Places"
    favoritesViewController.tabBarItem.title = "Favorites"
    return tabBarController
  }()

  func setupControllerWithWindow(window: UIWindow) {
    window.rootViewController = tabBarController
  }

}
