//
// Created by Vladimir Kravchenko on 3/20/16.
// Copyright (c) 2016 Vladimir Kravchenko. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ResponseHandling {
  static func arrayFromResponse(response: AnyObject?, withPath path: String?) -> [AnyObject]?
  static func dictionaryFromResponse(response: AnyObject?, withPath path: String?) -> [String: AnyObject]?
  static func stringFromResponse(response: AnyObject?, withPath path: String?) -> String?
  static func numberFromResponse(response: AnyObject?, withPath path: String?) -> NSNumber?
  static func intFromResponse(response: AnyObject?, withPath path: String?) -> Int?
  static func boolFromResponse(response: AnyObject?, withPath path: String?) -> Bool?
  static func doubleFromResponse(response: AnyObject?, withPath path: String?) -> Double?

  func arrayFromResponse(response: AnyObject?, withPath path: String?) -> [AnyObject]?
  func dictionaryFromResponse(response: AnyObject?, withPath path: String?) -> [String: AnyObject]?
  func stringFromResponse(response: AnyObject?, withPath path: String?) -> String?
  func numberFromResponse(response: AnyObject?, withPath path: String?) -> NSNumber?
  func intFromResponse(response: AnyObject?, withPath path: String?) -> Int?
  func boolFromResponse(response: AnyObject?, withPath path: String?) -> Bool?
  func doubleFromResponse(response: AnyObject?, withPath path: String?) -> Double?
}

extension ResponseHandling {

  static func arrayFromResponse(response: AnyObject?, withPath path: String? = nil) -> [AnyObject]? {
    return jsonFromResponse(response, withPath: path)?.arrayObject
  }

  static func dictionaryFromResponse(response: AnyObject?, withPath path: String? = nil) -> [String:AnyObject]? {
    return jsonFromResponse(response, withPath: path)?.dictionaryObject
  }

  static func stringFromResponse(response: AnyObject?, withPath path: String? = nil) -> String? {
    return jsonFromResponse(response, withPath: path)?.string
  }

  static func numberFromResponse(response: AnyObject?, withPath path: String? = nil) -> NSNumber? {
    return jsonFromResponse(response, withPath: path)?.number
  }

  static func intFromResponse(response: AnyObject?, withPath path: String? = nil) -> Int? {
    return numberFromResponse(response, withPath: path)?.integerValue
  }

  static func boolFromResponse(response: AnyObject?, withPath path: String? = nil) -> Bool? {
    return numberFromResponse(response, withPath: path)?.boolValue
  }

  static func doubleFromResponse(response: AnyObject?, withPath path: String? = nil) -> Double? {
    return numberFromResponse(response, withPath: path)?.doubleValue
  }

  func arrayFromResponse(response: AnyObject?, withPath path: String? = nil) -> [AnyObject]? {
    return self.dynamicType.arrayFromResponse(response, withPath: path)
  }

  func dictionaryFromResponse(response: AnyObject?, withPath path: String? = nil) -> [String:AnyObject]? {
    return self.dynamicType.dictionaryFromResponse(response, withPath: path)
  }

  func stringFromResponse(response: AnyObject?, withPath path: String? = nil) -> String? {
    return self.dynamicType.stringFromResponse(response, withPath: path)
  }

  func numberFromResponse(response: AnyObject?, withPath path: String? = nil) -> NSNumber? {
    return self.dynamicType.numberFromResponse(response, withPath: path)
  }

  func intFromResponse(response: AnyObject?, withPath path: String? = nil) -> Int? {
    return self.dynamicType.intFromResponse(response, withPath: path)
  }

  func boolFromResponse(response: AnyObject?, withPath path: String? = nil) -> Bool? {
    return self.dynamicType.boolFromResponse(response, withPath: path)
  }

  func doubleFromResponse(response: AnyObject?, withPath path: String? = nil) -> Double? {
    return self.dynamicType.doubleFromResponse(response, withPath: path)
  }

  private static func jsonFromResponse(response: AnyObject?, withPath path: String? = nil) -> JSON? {
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

  private static func configureJSON(inout json: JSON, withPath path: String?) {
    if let path = path {
      var pathComponents = path.componentsSeparatedByString(".")
      if pathComponents.first == defaultPathComponent() {
        pathComponents.removeFirst()
      }
      for pathComponent in pathComponents {
        json = json[pathComponent]
      }
    }
  }

  private static func defaultPathComponent() -> String {
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

