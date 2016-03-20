//
//  PlaceDetailsRouter.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import UIKit

public class PlaceDetailsRouter: BaseRouter {
  weak var delegate: AnyObject!
  weak var viewController: UIViewController!
  private let wireframe: PlaceDetailsWireframe

  init(withWireframe wireframe: PlaceDetailsWireframe) {
    self.wireframe = wireframe
  }
}

extension PlaceDetailsRouter: PlaceDetailsRouting {

}
