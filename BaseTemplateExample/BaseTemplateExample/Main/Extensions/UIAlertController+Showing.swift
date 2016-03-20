//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
  public class func showMessage(message: String) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
    UIViewController.topViewController().presentViewController(alert, animated: true, completion: nil)
  }
}