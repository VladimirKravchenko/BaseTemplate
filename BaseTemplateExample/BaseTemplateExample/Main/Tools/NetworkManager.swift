//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import Alamofire

typealias RequestSuccessClosure = AnyObject? -> Void
typealias RequestFailureClosure = (AnyObject?, NSError?) -> Void

class NetworkManager {
  static let sharedManager = NetworkManager()
  private var activeRequestsCount: Int = 0 {
    didSet {
      UIApplication.sharedApplication().networkActivityIndicatorVisible = activeRequestsCount > 0
    }
  }

  func getAtPath(path: String, parameters: [String:AnyObject]? = nil, success: RequestSuccessClosure? = nil,
                 failure: RequestFailureClosure? = nil) -> Request {
    return perfromRequest(.GET, atPath: path, parameters: parameters, success: success, failure: failure)
  }

  func postAtPath(path: String, parameters: [String:AnyObject]? = nil, success: RequestSuccessClosure? = nil,
                  failure: RequestFailureClosure? = nil) -> Request {
    return perfromRequest(.POST, atPath: path, parameters: parameters, success: success, failure: failure)
  }

  func putAtPath(path: String, parameters: [String:AnyObject]? = nil, success: RequestSuccessClosure? = nil,
                 failure: RequestFailureClosure? = nil) -> Request {
    return perfromRequest(.PUT, atPath: path, parameters: parameters, success: success, failure: failure)
  }

  func deleteAtPath(path: String, parameters: [String:AnyObject]? = nil, success: RequestSuccessClosure? = nil,
                    failure: RequestFailureClosure? = nil) -> Request {
    return perfromRequest(.DELETE, atPath: path, parameters: parameters, success: success, failure: failure)
  }

  private func perfromRequest(method: Alamofire.Method, atPath path: String,
                              parameters: [String:AnyObject]? = nil, success: RequestSuccessClosure? = nil,
                              failure: RequestFailureClosure? = nil) -> Request {
    let url = "https://api.foursquare.com/v2/" + path
    activeRequestsCount += 1
    let correctParams = updatedParamsForFoursquareAPI(parameters)
    let request = Alamofire.request(method, url, parameters: correctParams, encoding: encodingForMethod(method),
                                    headers: nil).responseJSON {
      response in
      self.activeRequestsCount -= 1
      let statusCode = response.response?.statusCode
      let isSuccess = statusCode != nil && statusCode >= 200 && statusCode < 300
      if isSuccess {
        success?(response.result.value)
      } else {
        failure?(response.result.value, response.result.error)
      }
    }
    return request
  }

  private func updatedParamsForFoursquareAPI(oldParams: [String: AnyObject]?) -> [String: AnyObject] {
    var updatedParams = oldParams ?? [String: AnyObject]()
    updatedParams["client_id"] = "NT20F0NB3YXESMG1R1JKF3K0GBDVR0AWQJ2KPZUJLMZGATQK"
    updatedParams["client_secret"] = "AH3GMTCVCBILOCWNZO2A1014BMDQV2K0YLPZUICCC3QUXHIL"
    updatedParams["v"] = "20160320"
    return updatedParams
  }

  private func encodingForMethod(method: Alamofire.Method) -> ParameterEncoding {
    switch method {
      case .POST: return .JSON
      case .PUT: return .JSON
      default: return .URL
    }
  }

}
