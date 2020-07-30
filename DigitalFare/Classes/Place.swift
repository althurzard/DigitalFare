//
//  Place.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import ObjectMapper
import CoreLocation

public struct Place: Mappable {
    
    public var location: Location?
    public var originalIndex: Int?
    public var placedID: String?
    
    public init?(map: Map) {
        mapping(map: map)
    }
    
    public mutating func mapping(map: Map) {
        location             <- map["location"]
        originalIndex   <- map["originalIndex"]
        placedID        <- map["placeId"]
    }
    
    
}
