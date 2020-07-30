//
//  Waypoint.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import ObjectMapper

public struct Waypoint: Mappable {
    var geoCoderStatus : String?
    var placeId        : String?
    var types          : [String]?
    
    public init?(map: Map) {
        mapping(map: map)
    }
    
    public mutating func mapping(map: Map) {
        geoCoderStatus <- map["geocoder_status"]
        placeId        <- map["place_id"]
        types          <- map["types"]
    }
    
}
