//
//  FavoritePlacesModule.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class FavoritePlacesModule: BaseModule {
  let viewController: UIViewController
  private let configurator: FavoritePlacesConfigurator

  required init(withViewController viewController: UIViewController, configurator: FavoritePlacesConfigurator) {
    self.viewController = viewController
    self.configurator = configurator
  }
}

//MARK: FavoritePlacesConfigurator protocol forwarding
extension FavoritePlacesModule: FavoritePlacesConfigurator {
  var delegate: FavoritePlacesDelegate? {
    get {
      return configurator.delegate
    }
    set (newDelegate) {
      configurator.delegate = newDelegate
    }
  }
}
