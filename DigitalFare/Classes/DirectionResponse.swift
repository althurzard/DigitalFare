//
//  DirectionResponse.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import ObjectMapper

public struct DirectionResponse: Mappable {
    public var geocodedWaypoints   : [Waypoint]?
    public var routes              : [Route]?
    public var status              : String?
    public init?(map: Map) {
        mapping(map: map)
    }
    
    public mutating func mapping(map: Map) {
        geocodedWaypoints   <- map["geocoded_waypoints"]
        routes              <- map["routes"]
        status              <- map["status"]
    }
}
