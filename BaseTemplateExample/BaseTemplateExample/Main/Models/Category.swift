//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation

class Category: Equatable {
  var id: String?
  var name: String?
  var iconURLString: String?
}

//MARK: Equatable
func ==(lhs: Category, rhs: Category) -> Bool {
  return lhs.id == rhs.id
}
