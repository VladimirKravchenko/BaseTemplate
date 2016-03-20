//
//  CategorySelectionViewController.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class CategorySelectionViewController: UIViewController, BaseView {
  var eventHandler: CategorySelectionEventHandler!
  @IBOutlet weak var tableView: UITableView!
  let refreshControl: UIRefreshControl = UIRefreshControl()
  var categories: [Category]?

  override func viewDidLoad() {
    super.viewDidLoad()
    configureInterface()
    refreshControl.beginRefreshing()
    refresh()
  }

  //MARK: Interface
  private func configureInterface() {
    configureTableView()
    configurePullToRefresh()
  }

  private func configureTableView() {
    tableView.dataSource = self
    tableView.delegate = self
  }

  private func configurePullToRefresh() {
    refreshControl.addTarget(self, action: "refresh", forControlEvents: .ValueChanged)
    tableView.addSubview(refreshControl)
  }

  func refresh() {
    eventHandler.handleRefreshEvent()
  }
  
  //MARK: IBAction
  @IBAction func closeButtonPressed(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
}

extension CategorySelectionViewController: CategorySelectionView {

  func showCategories(categories: [Category]?) {
    refreshControl.endRefreshing()
    self.categories = categories
    tableView?.reloadData()
  }

  func hideLoadingIndicators() {
    refreshControl.endRefreshing()
  }

}

extension CategorySelectionViewController: UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categories?.count ?? 0
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(CategoryCell.id(), forIndexPath: indexPath) as! CategoryCell
    let category = categories![indexPath.row]
    cell.nameLabel.text = category.name
    if let iconURLString = category.iconURLString, let url = NSURL(string: iconURLString) {
      cell.photoView.kf_setImageWithURL(url)
      cell.photoView.hidden = false
    } else {
      cell.photoView.image = nil
      cell.photoView.hidden = true
    }
    return cell
  }

}

extension CategorySelectionViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let category = categories![indexPath.row]
    eventHandler.handleCategorySelection(category)
  }

  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 60
  }

  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat.min
  }

  func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return CGFloat.min
  }

}
