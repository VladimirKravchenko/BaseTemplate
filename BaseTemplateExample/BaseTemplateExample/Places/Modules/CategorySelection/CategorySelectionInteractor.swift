//
//  CategorySelectionInteractor.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

class CategorySelectionInteractor: BaseInteractor {
  typealias PresenterType = CategorySelectionPresenting
  weak var presenter: CategorySelectionPresenting!
  private let service: PlaceCategoriesProvider

  init(withService service: PlaceCategoriesProvider) {
    self.service = service
  }

}

extension CategorySelectionInteractor: CategorySelectionInteracting {
  func requestCategories() {
    service.getCategories(success: {
      [weak self] categories in
      self?.presenter.presentCategories(categories)
    }, failure: {
      [weak self] errorMessage in
      self?.presenter.processCategoriesRequestFail(withErrorMessage: errorMessage)
    })
  }
}

typealias CategoriesClosure = [Category]? -> Void
protocol PlaceCategoriesProvider {
  func getCategories(success success: CategoriesClosure?, failure: FailureClosure?)
}
