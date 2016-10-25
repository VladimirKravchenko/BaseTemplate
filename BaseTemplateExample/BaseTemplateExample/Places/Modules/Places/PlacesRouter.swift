//
//  PlacesRouter.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import UIKit

class PlacesRouter: BaseRouter {
  weak var delegate: AnyObject!
  weak var viewController: UIViewController!
  fileprivate let wireframe: PlacesWireframe
  fileprivate let navigationController: UINavigationController
  fileprivate let presentingViewController: UIViewController
  var navigationControllerDelegate: UINavigationControllerDelegate?
  var transitioningDelegate: UIViewControllerTransitioningDelegate?

  init(withWireframe wireframe: PlacesWireframe, navigationController: UINavigationController,
       presentingViewController: UIViewController) {
    self.wireframe = wireframe
    self.navigationController = navigationController
    self.presentingViewController = presentingViewController
  }
}

extension PlacesRouter: PlacesRouting {

  func openCategorySelection() {
    let module = wireframe.categorySelectionModule()
    module.delegate = delegate as? CategorySelectionDelegate
    let viewController = module.viewController
    viewController.modalPresentationStyle = .custom
    viewController.transitioningDelegate = transitioningDelegate
    presentingViewController.present(viewController, animated: true, completion: nil)
  }

  func closeCategorySelection() {
    presentingViewController.presentedViewController?.dismiss(animated: true, completion: nil)
  }

  func openDetailsForPlace(_ place: Place) {
    let module = wireframe.placeDetailsModule()
    module.configureWithPlace(place)
    module.delegate = delegate as? PlaceDetailsDelegate
    navigationController.delegate = navigationControllerDelegate
    navigationController.pushViewController(module.viewController, animated: true)
  }

  func closePlaceDetails() {
    _ = viewController.navigationController?.popToViewController(viewController, animated: true)
  }

}
