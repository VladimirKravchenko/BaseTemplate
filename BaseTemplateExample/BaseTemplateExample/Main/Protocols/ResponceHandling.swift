//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ResponseHandling {
  static func arrayFromResponse(_ response: AnyObject?, withPath path: String?) -> [AnyObject]?
  static func dictionaryFromResponse(_ response: AnyObject?, withPath path: String?) -> [String: AnyObject]?
  static func stringFromResponse(_ response: AnyObject?, withPath path: String?) -> String?
  static func numberFromResponse(_ response: AnyObject?, withPath path: String?) -> NSNumber?
  static func intFromResponse(_ response: AnyObject?, withPath path: String?) -> Int?
  static func boolFromResponse(_ response: AnyObject?, withPath path: String?) -> Bool?
  static func doubleFromResponse(_ response: AnyObject?, withPath path: String?) -> Double?

  func arrayFromResponse(_ response: AnyObject?, withPath path: String?) -> [AnyObject]?
  func dictionaryFromResponse(_ response: AnyObject?, withPath path: String?) -> [String: AnyObject]?
  func stringFromResponse(_ response: AnyObject?, withPath path: String?) -> String?
  func numberFromResponse(_ response: AnyObject?, withPath path: String?) -> NSNumber?
  func intFromResponse(_ response: AnyObject?, withPath path: String?) -> Int?
  func boolFromResponse(_ response: AnyObject?, withPath path: String?) -> Bool?
  func doubleFromResponse(_ response: AnyObject?, withPath path: String?) -> Double?
}

extension ResponseHandling {

  static func arrayFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> [AnyObject]? {
    return jsonFromResponse(response, withPath: path)?.arrayObject as [AnyObject]?
  }

  static func dictionaryFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> [String:AnyObject]? {
    return jsonFromResponse(response, withPath: path)?.dictionaryObject as [String : AnyObject]?
  }

  static func stringFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> String? {
    return jsonFromResponse(response, withPath: path)?.string
  }

  static func numberFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> NSNumber? {
    return jsonFromResponse(response, withPath: path)?.number
  }

  static func intFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> Int? {
    return numberFromResponse(response, withPath: path)?.intValue
  }

  static func boolFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> Bool? {
    return numberFromResponse(response, withPath: path)?.boolValue
  }

  static func doubleFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> Double? {
    return numberFromResponse(response, withPath: path)?.doubleValue
  }

  func arrayFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> [AnyObject]? {
    return type(of: self).arrayFromResponse(response, withPath: path)
  }

  func dictionaryFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> [String:AnyObject]? {
    return type(of: self).dictionaryFromResponse(response, withPath: path)
  }

  func stringFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> String? {
    return type(of: self).stringFromResponse(response, withPath: path)
  }

  func numberFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> NSNumber? {
    return type(of: self).numberFromResponse(response, withPath: path)
  }

  func intFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> Int? {
    return type(of: self).intFromResponse(response, withPath: path)
  }

  func boolFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> Bool? {
    return type(of: self).boolFromResponse(response, withPath: path)
  }

  func doubleFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> Double? {
    return type(of: self).doubleFromResponse(response, withPath: path)
  }

  fileprivate static func jsonFromResponse(_ response: AnyObject?, withPath path: String? = nil) -> JSON? {
    if var json  = JSON(response)?[defaultPathComponent()] {
      if json == JSON.null {
        json = JSON(response)!
      }
      configureJSON(&json, withPath: path)
      return json
    } else {
      return nil
    }
  }

  fileprivate static func configureJSON(_ json: inout JSON, withPath path: String?) {
    if let path = path {
      var pathComponents = path.components(separatedBy: ".")
      if pathComponents.first == defaultPathComponent() {
        pathComponents.removeFirst()
      }
      for pathComponent in pathComponents {
        json = json[pathComponent]
      }
    }
  }

  fileprivate static func defaultPathComponent() -> String {
    return "response"
  }

}

extension JSON {
  public init?(_ object: AnyObject?) {
    guard object != nil else {
      return nil
    }
    self.init(object!)
  }
}

