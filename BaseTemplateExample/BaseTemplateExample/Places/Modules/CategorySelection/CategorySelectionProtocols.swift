//
//  CategorySelectionProtocols.swift
//  BaseTemplateExample
//
//  Created by Vladimir Kravchenko on 20/03/2016.
//  Copyright © 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

protocol CategorySelectionConfigurator: class {
  weak var delegate: CategorySelectionDelegate? {get set}
}

protocol CategorySelectionDelegate: class {
}

protocol CategorySelectionInteracting: class {
}

protocol CategorySelectionPresenting: class {
}

protocol CategorySelectionView: class {
}

protocol CategorySelectionEventHandler: class {
}

protocol CategorySelectionRouting: class {
}

protocol CategorySelectionWireframe: class {
}
