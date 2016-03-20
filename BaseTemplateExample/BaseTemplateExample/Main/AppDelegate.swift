//
//  AppDelegate.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 3/20/16.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window!.makeKeyAndVisible()
    let wireframe = RootWireframe()
    wireframe.setupControllerWithWindow(window!)
    return true
  }

}

