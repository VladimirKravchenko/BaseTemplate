//
//  CategorySelectionProtocols.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

protocol CategorySelectionConfigurator: class {
  weak var delegate: CategorySelectionDelegate? {get set}
}

protocol CategorySelectionDelegate: class {
  func updateForSelectedCategory(category: Category)
}

protocol CategorySelectionInteracting: class {
  func requestCategories()
}

protocol CategorySelectionPresenting: class {
  func presentCategories(categories: [Category]?)
  func processCategoriesRequestFail(withErrorMessage message: String?)
}

protocol CategorySelectionViewing: class {
  func showCategories(categories: [Category]?)
  func hideLoadingIndicators()
}

protocol CategorySelectionEventHandler: class {
  func handleRefreshEvent()
  func handleCategorySelection(category: Category)
}

protocol CategorySelectionRouting: class {
}

protocol CategorySelectionWireframe: class {
}
