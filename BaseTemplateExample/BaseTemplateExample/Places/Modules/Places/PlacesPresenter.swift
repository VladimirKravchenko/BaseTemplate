//
//  PlacesPresenter.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

class PlacesPresenter: BasePresenter {
  typealias ViewType = PlacesView
  weak var delegate: PlacesDelegate?
  weak var view: PlacesView!
  var interactor: PlacesInteracting!
  var router: PlacesRouting!
}

extension PlacesPresenter: PlacesConfigurator {
}

extension PlacesPresenter: PlacesPresenting {
}

extension PlacesPresenter: PlacesEventHandler {
}
