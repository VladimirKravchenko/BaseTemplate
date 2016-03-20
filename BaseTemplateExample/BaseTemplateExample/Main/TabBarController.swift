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
  private func configureInterface() {
    configureTabBar()
    configureTabBarItems()
  }

  private func configureTabBar() {
    tabBar.translucent = false
    tabBar.itemPositioning = .Fill
    tabBar.tintColor = UIColor.tintColor()
    tabBar.backgroundColor = UIColor.whiteColor()
    //no shadow
    tabBar.shadowImage = UIImage()
    tabBar.backgroundImage = UIImage()
  }

  private func configureTabBarItems() {
    let normalAttributes = [NSFontAttributeName: UIFont.mainFont(),
                            NSForegroundColorAttributeName: UIColor.placeholderTextColor()]
    let selectedAttributes = [NSFontAttributeName: UIFont.mainFont(),
                              NSForegroundColorAttributeName: UIColor.textColor()]
    UITabBarItem.appearance().setTitleTextAttributes(normalAttributes, forState: .Normal)
    UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, forState: .Selected)
    UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -10)
  }

}
