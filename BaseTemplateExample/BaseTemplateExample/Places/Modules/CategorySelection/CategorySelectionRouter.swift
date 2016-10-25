//
//  CategorySelectionRouter.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import UIKit

class CategorySelectionRouter: BaseRouter {
  weak var delegate: AnyObject!
  weak var viewController: UIViewController!
  private let wireframe: CategorySelectionWireframe

  init(withWireframe wireframe: CategorySelectionWireframe) {
    self.wireframe = wireframe
  }
}

extension CategorySelectionRouter: CategorySelectionRouting {
}
