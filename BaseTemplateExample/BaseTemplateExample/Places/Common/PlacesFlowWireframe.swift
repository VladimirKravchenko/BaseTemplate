//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class PlacesFlowWireframe {

  func placesModule() -> PlacesModule {
    let identifier = PlacesViewControllersIdentifiers.Places
    let viewController = storyboard().instantiateViewControllerWithIdentifier(identifier) as! PlacesViewController
    let presenter = PlacesPresenter()
    let interactor = PlacesInteractor()
    let router = PlacesRouter(withWireframe: PlacesFlowWireframe())
    return try! moduleWithType(PlacesModule.self, presenter: presenter, view: viewController,
                               interactor: interactor, router: router)
  }

  private func storyboard() -> UIStoryboard {
    return UIStoryboard(name: "Places", bundle: nil)
  }

}

extension PlacesFlowWireframe: PlacesWireframe {}
