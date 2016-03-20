//
//  CategorySelectionModule.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class CategorySelectionModule: BaseModule {
  let viewController: UIViewController
  private let configurator: CategorySelectionConfigurator

  required init(withViewController viewController: UIViewController, configurator: CategorySelectionConfigurator) {
    self.viewController = viewController
    self.configurator = configurator
  }
}

//MARK: CategorySelectionConfigurator protocol forwarding
extension CategorySelectionModule: CategorySelectionConfigurator {
  var delegate: CategorySelectionDelegate? {
    get {
      return configurator.delegate
    }
    set (newDelegate) {
      configurator.delegate = newDelegate
    }
  }
}
