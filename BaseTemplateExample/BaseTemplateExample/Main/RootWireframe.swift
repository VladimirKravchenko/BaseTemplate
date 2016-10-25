//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class RootWireframe {
  fileprivate lazy var tabBarController: TabBarController = {
    let tabBarController = TabBarController()
    let placesNavigationController = UINavigationController()
    let placesModule = PlacesFlowWireframe().placesModule(withNavigationController: placesNavigationController,
                                                          presentingViewController: tabBarController)
    placesNavigationController.viewControllers = [placesModule.viewController]

    let favoritesNavigationController = UINavigationController()
    let favoritesModule = FavoritesFlowWireframe().favoritePlacesModule()
    favoritesNavigationController.viewControllers = [favoritesModule.viewController]
    tabBarController.viewControllers = [placesNavigationController, favoritesNavigationController]
    placesNavigationController.tabBarItem.title = "Places"
    favoritesNavigationController.tabBarItem.title = "Favorites"
    return tabBarController
  }()

  func setupControllerWithWindow(_ window: UIWindow) {
    window.rootViewController = tabBarController
  }

}
