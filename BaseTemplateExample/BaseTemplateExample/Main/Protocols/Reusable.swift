//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

protocol Reusable: class {
  static func id() -> String
  static func nib() -> UINib?
}

extension Reusable {

  static func id() -> String {
    return String(describing: self)
  }

  static func nib() -> UINib? {
    return UINib(nibName: String(describing: self), bundle: nil)
  }

}
