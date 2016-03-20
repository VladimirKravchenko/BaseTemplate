//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import CoreLocation
import ObjectMapper

class PlacesService: ResponseHandling {
}

extension PlacesService: PlacesFetching {

  func getPlaces(nearLocation location: CLLocation, inRadius radius: Int, forCategory category: Category?,
                 withSearchString searchString: String?, success: PlacesClosure?, failure: FailureClosure?) {
    var params: [String: AnyObject] = [
        "ll": "\(location.coordinate.latitude),\(location.coordinate.longitude)",
        "intent": "browse",
        "radius": radius,
    ]
    if let categoryId = category?.id {
      params["categoryId"] = categoryId
    }
    if let searchString = searchString {
      params["query"] = searchString
    }
    NetworkManager.sharedManager.getAtPath("venues/search", parameters: params, success: {
      response in
      let places = Mapper<Place>().mapArray(self.arrayFromResponse(response, withPath: "venues"))
      success?(places)
    }, failure: {
      response, error in
      if let errorMessage = error?.localizedDescription {
        failure?(errorMessage)
      }
    })
  }

}
