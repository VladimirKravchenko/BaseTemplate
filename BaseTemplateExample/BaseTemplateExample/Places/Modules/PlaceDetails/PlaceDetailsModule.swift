//
//  PlaceDetailsModule.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class PlaceDetailsModule: BaseModule {
  let viewController: UIViewController
  private let configurator: PlaceDetailsConfigurator

  required init(withViewController viewController: UIViewController, configurator: PlaceDetailsConfigurator) {
    self.viewController = viewController
    self.configurator = configurator
  }
}

//MARK: PlaceDetailsConfigurator protocol forwarding
extension PlaceDetailsModule: PlaceDetailsConfigurator {
  var delegate: PlaceDetailsDelegate? {
    get {
      return configurator.delegate
    }
    set (newDelegate) {
      configurator.delegate = newDelegate
    }
  }

  func configureWithPlace(place: Place) {
    configurator.configureWithPlace(place)
  }

}
