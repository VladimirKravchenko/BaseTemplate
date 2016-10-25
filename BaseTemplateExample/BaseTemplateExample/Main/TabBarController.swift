//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    configureInterface()
  }

  //MARK: Interface
  fileprivate func configureInterface() {
    configureTabBar()
    configureTabBarItems()
  }

  fileprivate func configureTabBar() {
    tabBar.isTranslucent = false
    tabBar.itemPositioning = .fill
    tabBar.tintColor = UIColor.tintColor()
    tabBar.backgroundColor = UIColor.colorFromHex(0xf7f7f7)
    //no shadow
    tabBar.shadowImage = UIImage()
    tabBar.backgroundImage = UIImage()
  }

  fileprivate func configureTabBarItems() {
    let normalAttributes = [NSFontAttributeName: UIFont.mediumDisplayFont(withSize: 17),
                            NSForegroundColorAttributeName: UIColor.placeholderTextColor()]
    let selectedAttributes = [NSFontAttributeName: UIFont.mediumDisplayFont(withSize: 17),
                              NSForegroundColorAttributeName: UIColor.textColor()]
    UITabBarItem.appearance().setTitleTextAttributes(normalAttributes, for: UIControlState())
    UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, for: .selected)
    UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
  }

}
