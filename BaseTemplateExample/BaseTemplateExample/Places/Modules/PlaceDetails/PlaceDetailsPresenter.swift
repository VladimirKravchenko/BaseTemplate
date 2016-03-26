//
//  PlaceDetailsPresenter.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

class PlaceDetailsPresenter: BasePresenter {
  typealias ViewType = PlaceDetailsViewing
  weak var delegate: PlaceDetailsDelegate?
  weak var view: PlaceDetailsViewing!
  var interactor: PlaceDetailsInteracting!
  var router: PlaceDetailsRouting!
}

extension PlaceDetailsPresenter: PlaceDetailsConfigurator {

  func configureWithPlace(place: Place) {
    view.showPlace(place)
  }

}

extension PlaceDetailsPresenter: PlaceDetailsPresenting {
}

extension PlaceDetailsPresenter: PlaceDetailsEventHandler {
}
