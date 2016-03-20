//
//  PlacesRouter.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import UIKit

public class PlacesRouter: BaseRouter {
  weak var delegate: AnyObject!
  weak var viewController: UIViewController!
  private let wireframe: PlacesWireframe

  init(withWireframe wireframe: PlacesWireframe) {
    self.wireframe = wireframe
  }
}

extension PlacesRouter: PlacesRouting {

}
