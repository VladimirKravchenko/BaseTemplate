//
//  FavoritePlacesProtocols.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

protocol FavoritePlacesConfigurator: class {
  weak var delegate: FavoritePlacesDelegate? {get set}
}

protocol FavoritePlacesDelegate: class {
}

protocol FavoritePlacesInteracting: class {
}

protocol FavoritePlacesPresenting: class {
}

protocol FavoritePlacesView: class {
}

protocol FavoritePlacesEventHandler: class {
}

protocol FavoritePlacesRouting: class {
}

protocol FavoritePlacesWireframe: class {
}
