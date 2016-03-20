//
//  PlacesInteractor.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

class PlacesInteractor: BaseInteractor {
  typealias PresenterType = PlacesPresenting
  weak var presenter: PlacesPresenting!
}

extension PlacesInteractor: PlacesInteracting {
}
