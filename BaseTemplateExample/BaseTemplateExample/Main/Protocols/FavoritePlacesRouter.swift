//
//  FavoritePlacesRouter.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import UIKit

class FavoritePlacesRouter: BaseRouter {
  weak var delegate: AnyObject!
  weak var viewController: UIViewController!
  fileprivate let wireframe: FavoritePlacesWireframe

  init(withWireframe wireframe: FavoritePlacesWireframe) {
    self.wireframe = wireframe
  }
}

extension FavoritePlacesRouter: FavoritePlacesRouting {

}
