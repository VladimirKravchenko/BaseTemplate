//
//  PlaceDetailsViewController.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class PlaceDetailsViewController: UIViewController, BaseView {
  var eventHandler: PlaceDetailsEventHandler!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension PlaceDetailsViewController: PlaceDetailsView {
}
