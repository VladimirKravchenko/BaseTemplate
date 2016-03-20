//
//  PlacesProtocols.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

protocol PlacesConfigurator: class {
  weak var delegate: PlacesDelegate? {get set}
}

protocol PlacesDelegate: class {
}

protocol PlacesInteracting: class {
}

protocol PlacesPresenting: class {
}

protocol PlacesView: class {
}

protocol PlacesEventHandler: class {
}

protocol PlacesRouting: class {
}

protocol PlacesWireframe: class {
}
