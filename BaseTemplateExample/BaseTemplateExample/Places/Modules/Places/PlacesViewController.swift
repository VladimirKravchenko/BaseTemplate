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
  }

  //MARK: Interface
  private func configureInterface() {
    configureSearchField()
    configureTableView()
    configurePullToRefresh()
  }

  private func configureSearchField() {
    searchField.delegate = self
    searchField.returnKeyType = .Search
  }

  private func configureTableView() {
    tableView.dataSource = self
    tableView.delegate = self
  }

  private func configurePullToRefresh() {
    refreshControl.addTarget(self, action: "refresh", forControlEvents: .ValueChanged)
  }

  private func refresh() {
    eventHandler.handleRefreshEvent()
  }

  //MARK: IBActions

  @IBAction func cancelButtonPressed(sender: AnyObject) {
    searchField.text = ""
    searchForString("")
    cancelButton.hidden = true
  }

  private func searchForString(string: String) {
    eventHandler.handleSearchForString(string)
  }
  
  @IBAction func categoryButtonPressed(sender: AnyObject) {
    eventHandler.handleCategorySelection()
  }
  
}

extension PlacesViewController: PlacesView {

  func showPlaces(places: [Place]?) {
    self.places = places
    refreshControl.endRefreshing()
    tableView?.reloadData()
  }

}

extension PlacesViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return places?.count ?? 0
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(PlaceCell.id(), forIndexPath: indexPath) as! PlaceCell
    let place = places![indexPath.row]
    cell.nameLabel.text = place.name ?? "No name"
    cell.addressLabel.hidden = place.address == nil
    cell.addressLabel.text = place.address
    if let distance = place.distance {
      cell.distanceLabel.text = "\(distance)m"
    } else {
      cell.distanceLabel.text = nil
    }
    cell.distanceLabel.hidden = place.distance == nil
    return cell
  }

}

extension PlacesViewController: UITableViewDelegate {

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let place = places![indexPath.row]
    eventHandler.handlePlaceSelection(place)
  }

  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return UITableViewAutomaticDimension
  }

  func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat.min
  }

  func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return CGFloat.min
  }

}

extension PlacesViewController: UITextFieldDelegate {

  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange,
                 replacementString string: String) -> Bool {
    let resultString: NSString = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
    cancelButton.hidden = resultString.length == 0
    return true
  }

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.endEditing(true)
    if let searchString = textField.text {
      searchForString(searchString)
    }
    return true
  }
}