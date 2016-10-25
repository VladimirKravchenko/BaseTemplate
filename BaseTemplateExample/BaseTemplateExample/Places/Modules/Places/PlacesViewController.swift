//
//  PlacesViewController.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class PlacesViewController: UIViewController, BaseView {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchField: UITextField!
  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var categoryButton: UIButton!
  let refreshControl: UIRefreshControl = UIRefreshControl()
  var eventHandler: PlacesEventHandler!
  var places: [Place]?

  override func viewDidLoad() {
    super.viewDidLoad()
    configureInterface()
    refreshControl.beginRefreshing()
    refresh()
  }

  //MARK: Interface
  fileprivate func configureInterface() {
    configureSearchField()
    configureTableView()
    configurePullToRefresh()
  }

  fileprivate func configureSearchField() {
    searchField.delegate = self
    searchField.returnKeyType = .search
  }

  fileprivate func configureTableView() {
    tableView.dataSource = self
    tableView.delegate = self
  }

  fileprivate func configurePullToRefresh() {
    refreshControl.addTarget(self, action: #selector(PlacesViewController.refresh), for: .valueChanged)
    tableView.addSubview(refreshControl)
  }

  func refresh() {
    eventHandler.handleRefreshEvent()
  }

  //MARK: IBActions

  @IBAction func cancelButtonPressed(_ sender: AnyObject) {
    searchField.text = ""
    searchForString("")
    cancelButton.isHidden = true
  }

  fileprivate func searchForString(_ string: String) {
    eventHandler.handleSearchForString(string)
  }
  
  @IBAction func categoryButtonPressed(_ sender: AnyObject) {
    eventHandler.handleCategorySelection()
  }
  
}

extension PlacesViewController: PlacesViewing {

  func showPlaces(_ places: [Place]?) {
    self.places = places
    refreshControl.endRefreshing()
    tableView?.reloadData()
  }

  func showCategoryName(_ name: String?) {
    let title = name ?? "All categories"
    categoryButton.setTitle(title, for: UIControlState())
  }

  func showLoadingIndicators() {
    refreshControl.beginRefreshing()
    tableView.setContentOffset(CGPoint(x: 0, y: -self.refreshControl.frame.size.height), animated:true);
  }

  func hideLoadingIndicators() {
    refreshControl.endRefreshing()
  }

}

extension PlacesViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return places?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PlaceCell.id(), for: indexPath) as! PlaceCell
    let place = places![(indexPath as NSIndexPath).row]
    cell.nameLabel.text = place.name ?? "No name"
    cell.addressLabel.isHidden = place.address == nil
    cell.addressLabel.text = place.address
    if let distance = place.distance {
      cell.distanceLabel.text = "\(distance)m"
    } else {
      cell.distanceLabel.text = nil
    }
    cell.distanceLabel.isHidden = place.distance == nil
    return cell
  }

}

extension PlacesViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let place = places![(indexPath as NSIndexPath).row]
    eventHandler.handlePlaceSelection(place)
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat.leastNormalMagnitude
  }

  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return CGFloat.leastNormalMagnitude
  }

}

extension PlacesViewController: UITextFieldDelegate {

  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                 replacementString string: String) -> Bool {
    let resultString: NSString = (textField.text! as NSString).replacingCharacters(in: range, with: string) as NSString
    cancelButton.isHidden = resultString.length == 0
    if resultString.length == 0 {
      searchForString("")
    }
    return true
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.endEditing(true)
    if let searchString = textField.text {
      searchForString(searchString)
    }
    return true
  }
}
