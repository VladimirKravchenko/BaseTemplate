//
//  PlaceDetailsProtocols.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

protocol PlaceDetailsConfigurator: class {
  weak var delegate: PlaceDetailsDelegate? {get set}
  func configureWithPlace(place: Place)
}

protocol PlaceDetailsDelegate: class {
}

protocol PlaceDetailsInteracting: class {
}

protocol PlaceDetailsPresenting: class {
}

protocol PlaceDetailsView: class {
}

protocol PlaceDetailsEventHandler: class {
}

protocol PlaceDetailsRouting: class {
}

protocol PlaceDetailsWireframe: class {
}
