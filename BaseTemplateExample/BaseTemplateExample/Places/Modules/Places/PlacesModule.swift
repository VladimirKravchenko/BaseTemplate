//
//  PlacesModule.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class PlacesModule: BaseModule {
  let viewController: UIViewController
  var delegate: PlacesDelegate? {
    get {
      return configurator.delegate
    }
    set (newDelegate) {
      configurator.delegate = newDelegate
    }
  }
  private let configurator: PlacesConfigurator

  required init(withViewController viewController: UIViewController, configurator: PlacesConfigurator) {
    self.viewController = viewController
    self.configurator = configurator
  }
}

//MARK: PlacesConfigurator protocol forwarding
extension PlacesModule: PlacesConfigurator {
}
