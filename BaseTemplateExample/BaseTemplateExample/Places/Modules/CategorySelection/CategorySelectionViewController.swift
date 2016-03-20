//
//  CategorySelectionViewController.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class CategorySelectionViewController: UIViewController, BaseView {
  var eventHandler: CategorySelectionEventHandler!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  //MARK: IBAction
  @IBAction func closeButtonPressed(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
}

extension CategorySelectionViewController: CategorySelectionView {
}
