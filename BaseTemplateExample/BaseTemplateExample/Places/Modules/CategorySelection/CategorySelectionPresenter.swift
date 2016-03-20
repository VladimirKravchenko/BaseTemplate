//
//  CategorySelectionPresenter.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

class CategorySelectionPresenter: BasePresenter {
  typealias ViewType = CategorySelectionView
  weak var delegate: CategorySelectionDelegate?
  weak var view: CategorySelectionView!
  var interactor: CategorySelectionInteracting!
  var router: CategorySelectionRouting!
}

extension CategorySelectionPresenter: CategorySelectionConfigurator {
}

extension CategorySelectionPresenter: CategorySelectionPresenting {
}

extension CategorySelectionPresenter: CategorySelectionEventHandler {
}
