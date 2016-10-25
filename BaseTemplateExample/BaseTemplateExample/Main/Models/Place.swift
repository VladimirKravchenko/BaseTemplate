//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import ObjectMapper

class Place: Equatable {
  var id: String?
  var name: String?
  var country: String?
  var city: String?
  var address: String?
  var distance: Double?
  var lat: Double?
  var lng: Double?
  var phone: String?
  
  required init?(map: Map) {}
}

extension Place: Mappable {

  // Mappable
  func mapping(map: Map) {
    id <- map["id"]
    name <- map["name"]
    country <- map["location.country"]
    city <- map["location.city"]
    address <- map["location.address"]
    distance <- map["location.distance"]
    lat <- map["location.lat"]
    lng <- map["location.lng"]
    phone <- map["contact.phone"]
  }
}

//MARK: Equatable
func ==(lhs: Place, rhs: Place) -> Bool {
  return lhs.id == rhs.id
}
