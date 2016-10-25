//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import Alamofire

typealias RequestSuccessClosure = (AnyObject?) -> Void
typealias RequestFailureClosure = (AnyObject?, NSError?) -> Void

class NetworkManager {
  static let sharedManager = NetworkManager()
  fileprivate var activeRequestsCount: Int = 0 {
    didSet {
      UIApplication.shared.isNetworkActivityIndicatorVisible = activeRequestsCount > 0
    }
  }

  func getAtPath(_ path: String, parameters: [String:AnyObject]? = nil, success: RequestSuccessClosure? = nil,
                 failure: RequestFailureClosure? = nil) -> Request {
    return perfromRequest(.get, atPath: path, parameters: parameters, success: success, failure: failure)
  }

  func postAtPath(_ path: String, parameters: [String:AnyObject]? = nil, success: RequestSuccessClosure? = nil,
                  failure: RequestFailureClosure? = nil) -> Request {
    return perfromRequest(.post, atPath: path, parameters: parameters, success: success, failure: failure)
  }

  func putAtPath(_ path: String, parameters: [String:AnyObject]? = nil, success: RequestSuccessClosure? = nil,
                 failure: RequestFailureClosure? = nil) -> Request {
    return perfromRequest(.put, atPath: path, parameters: parameters, success: success, failure: failure)
  }

  func deleteAtPath(_ path: String, parameters: [String:AnyObject]? = nil, success: RequestSuccessClosure? = nil,
                    failure: RequestFailureClosure? = nil) -> Request {
    return perfromRequest(.delete, atPath: path, parameters: parameters, success: success, failure: failure)
  }

  fileprivate func perfromRequest(_ method: Alamofire.HTTPMethod, atPath path: String,
                              parameters: [String:AnyObject]? = nil, success: RequestSuccessClosure? = nil,
                              failure: RequestFailureClosure? = nil) -> Request {
    let url = "https://api.foursquare.com/v2/" + path
    activeRequestsCount += 1
    let correctParams = updatedParamsForFoursquareAPI(parameters)
    let request = Alamofire.request(url, method: method, parameters: correctParams, encoding: URLEncoding.methodDependent, headers: nil).responseJSON {
      response in
      self.activeRequestsCount -= 1
      let statusCode = response.response?.statusCode
      if let statusCode = statusCode, statusCode >= 200 && statusCode < 300 {
        success?(response.result.value as AnyObject?)
      } else {
        failure?(response.result.value as AnyObject?, response.result.error as NSError?)
      }
    }
    return request
  }

  fileprivate func updatedParamsForFoursquareAPI(_ oldParams: [String: AnyObject]?) -> [String: AnyObject] {
    var updatedParams = oldParams ?? [String: AnyObject]()
    updatedParams["client_id"] = "NT20F0NB3YXESMG1R1JKF3K0GBDVR0AWQJ2KPZUJLMZGATQK" as AnyObject?
    updatedParams["client_secret"] = "AH3GMTCVCBILOCWNZO2A1014BMDQV2K0YLPZUICCC3QUXHIL" as AnyObject?
    updatedParams["v"] = "20160320" as AnyObject?
    return updatedParams
  }

}
