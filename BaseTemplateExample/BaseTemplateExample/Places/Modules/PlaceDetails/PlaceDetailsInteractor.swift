//
//  PlaceDetailsInteractor.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

class PlaceDetailsInteractor: BaseInteractor {
  typealias PresenterType = PlaceDetailsPresenting
  weak var presenter: PlaceDetailsPresenting!
}

extension PlaceDetailsInteractor: PlaceDetailsInteracting {
}
