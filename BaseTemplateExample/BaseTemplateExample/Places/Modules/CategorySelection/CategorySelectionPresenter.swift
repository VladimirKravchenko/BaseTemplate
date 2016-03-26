//
//  CategorySelectionPresenter.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import UIKit

class CategorySelectionPresenter: BasePresenter {
  typealias ViewType = CategorySelectionViewing
  weak var delegate: CategorySelectionDelegate?
  weak var view: CategorySelectionViewing!
  var interactor: CategorySelectionInteracting!
  var router: CategorySelectionRouting!
}

extension CategorySelectionPresenter: CategorySelectionConfigurator {
}

extension CategorySelectionPresenter: CategorySelectionPresenting {

  func presentCategories(categories: [Category]?) {
    view.showCategories(categories)
  }

  func processCategoriesRequestFail(withErrorMessage message: String?) {
    view.hideLoadingIndicators()
    if let message = message {
      UIAlertController.showMessage(message)
    }
  }

}

extension CategorySelectionPresenter: CategorySelectionEventHandler {

  func handleRefreshEvent() {
    interactor.requestCategories()
  }

  func handleCategorySelection(category: Category) {
    delegate?.updateForSelectedCategory(category)
  }

}
