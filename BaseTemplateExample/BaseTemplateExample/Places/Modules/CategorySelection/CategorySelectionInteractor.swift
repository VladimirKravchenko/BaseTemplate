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
}

extension CategorySelectionInteractor: CategorySelectionInteracting {
}
