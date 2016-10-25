//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import ObjectMapper

class Category: Equatable {
  var id: String?
  var name: String?
  var iconURLString: String?

  required init?(map: Map) {}
}

extension Category: Mappable {

  func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    iconURLString <- (map["icon"], IconURLTransform())
  }

}

//MARK: Equatable
func ==(lhs: Category, rhs: Category) -> Bool {
  return lhs.id == rhs.id
}

private class IconURLTransform: TransformType {
  typealias Object = String
  typealias JSON = [String: String]

  init() {
  }

  func transformFromJSON(_ value: Any?) -> String? {
    if let value = value as? JSON, let prefix = value["prefix"], let suffix = value["suffix"] {
      return prefix + suffix
    }
    return nil
  }

  func transformToJSON(_ value: String?) -> [String: String]? {
    return nil
  }
}
