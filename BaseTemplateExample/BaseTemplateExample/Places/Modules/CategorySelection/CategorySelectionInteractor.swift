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
  private let service: PlaceCategoriesFetching

  init(withService service: PlaceCategoriesFetching) {
    self.service = service
  }

}

extension CategorySelectionInteractor: CategorySelectionInteracting {
  func fetchCategories() {
    service.getCategories(success: {
      [weak self] categories in
      self?.presenter.presentCategories(categories)
    }, failure: {
      [weak self] errorMessage in
      self?.presenter.processCategoriesFetchFail(withErrorMessage: errorMessage)
    })
  }
}

typealias CategoriesClosure = [Category]? -> Void
protocol PlaceCategoriesFetching {
  func getCategories(success success: CategoriesClosure?, failure: FailureClosure?)
}
