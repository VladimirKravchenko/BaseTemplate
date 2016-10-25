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
    refreshControl.addTarget(self, action: #selector(CategorySelectionViewController.refresh), for: .valueChanged)
    tableView.addSubview(refreshControl)
  }

  func refresh() {
    eventHandler.handleRefreshEvent()
  }
  
  //MARK: IBAction
  @IBAction func closeButtonPressed(_ sender: AnyObject) {
    self.dismiss(animated: true, completion: nil)
  }
  
}

extension CategorySelectionViewController: CategorySelectionViewing {

  func showCategories(_ categories: [Category]?) {
    refreshControl.endRefreshing()
    self.categories = categories
    tableView?.reloadData()
  }

  func hideLoadingIndicators() {
    refreshControl.endRefreshing()
  }

}

extension CategorySelectionViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categories?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.id(), for: indexPath) as! CategoryCell
    let category = categories![(indexPath as NSIndexPath).row]
    cell.nameLabel.text = category.name
    if let iconURLString = category.iconURLString, let url = URL(string: iconURLString) {
      cell.photoView.kf.setImage(with: url)
      cell.photoView.isHidden = false
    } else {
      cell.photoView.image = nil
      cell.photoView.isHidden = true
    }
    return cell
  }

}

extension CategorySelectionViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let category = categories![(indexPath as NSIndexPath).row]
    eventHandler.handleCategorySelection(category)
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat.leastNormalMagnitude
  }

  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return CGFloat.leastNormalMagnitude
  }

}
