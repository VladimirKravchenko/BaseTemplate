//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class PlacesFlowWireframe {

  func placesModule(withNavigationController navigationController: UINavigationController,
                    presentingViewController: UIViewController) -> PlacesModule {
    let identifier = PlacesViewControllersIdentifiers.Places
    let viewController = storyboard().instantiateViewControllerWithIdentifier(identifier) as! PlacesViewController
    let presenter = PlacesPresenter()
    let interactor = PlacesInteractor(withPlacesService: PlacesService(), locationService: LocationService())
    let router = PlacesRouter(withWireframe: PlacesFlowWireframe(), navigationController: navigationController,
                              presentingViewController: presentingViewController)
    return try! moduleWithType(PlacesModule.self, presenter: presenter, view: viewController,
                               interactor: interactor, router: router)
  }

  private func storyboard() -> UIStoryboard {
    return UIStoryboard(name: "Places", bundle: nil)
  }

}

extension PlacesFlowWireframe: PlacesWireframe {

  func categorySelectionModule() -> CategorySelectionModule {
    let identifier = PlacesViewControllersIdentifiers.CategorySelection
    let viewController = storyboard().instantiateViewControllerWithIdentifier(identifier) as! CategorySelectionViewController
    let presenter = CategorySelectionPresenter()
    let interactor = CategorySelectionInteractor(withService: PlacesService())
    let router = CategorySelectionRouter(withWireframe: PlacesFlowWireframe())
    return try! moduleWithType(CategorySelectionModule.self, presenter: presenter, view: viewController,
                               interactor: interactor, router: router)
  }

  func placeDetailsModule() -> PlaceDetailsModule {
    let identifier = PlacesViewControllersIdentifiers.PlaceDetails
    let viewController = storyboard().instantiateViewControllerWithIdentifier(identifier) as! PlaceDetailsViewController
    let presenter = PlaceDetailsPresenter()
    let interactor = PlaceDetailsInteractor()
    let router = PlaceDetailsRouter(withWireframe: PlacesFlowWireframe())
    return try! moduleWithType(PlaceDetailsModule.self, presenter: presenter, view: viewController,
                               interactor: interactor, router: router)
  }
}

extension PlacesFlowWireframe: CategorySelectionWireframe {}

extension PlacesFlowWireframe: PlaceDetailsWireframe {}
