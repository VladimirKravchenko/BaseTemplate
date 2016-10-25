//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import CoreLocation
import ObjectMapper

class PlacesService: ResponseHandling {
}

extension PlacesService: PlacesProvider {
  func getPlaces(nearLocation location: CLLocation, inRadius radius: Int, forCategory category: Category?,
                 withSearchString searchString: String?, success: PlacesClosure?, failure: FailureClosure?) {
    var params: [String: AnyObject] = [
        "ll": "\(location.coordinate.latitude),\(location.coordinate.longitude)" as AnyObject,
        "intent": "browse" as AnyObject,
        "radius": radius as AnyObject,
    ]
    if let categoryId = category?.id {
      params["categoryId"] = categoryId as AnyObject?
    }
    if let searchString = searchString {
      params["query"] = searchString as AnyObject?
    }
    _ = NetworkManager.sharedManager.getAtPath("venues/search", parameters: params, success: {
      response in
      let places = Mapper<Place>().mapArray(JSONObject: self.arrayFromResponse(response, withPath: "venues"))
      success?(places)
    }, failure: {
      response, error in
      if let errorMessage = error?.localizedDescription {
        failure?(errorMessage)
      }
    })
  }
}

extension PlacesService: PlaceCategoriesProvider {
  func getCategories(success: CategoriesClosure?, failure: FailureClosure?) {
    _ = NetworkManager.sharedManager.getAtPath("venues/categories", parameters: nil, success: {
      response in
      let categories = Mapper<Category>().mapArray(JSONObject: self.arrayFromResponse(response, withPath: "categories"))
      success?(categories)
    }, failure: {
      response, error in
      if let errorMessage = error?.localizedDescription {
        failure?(errorMessage)
      }
    })
  }
}
