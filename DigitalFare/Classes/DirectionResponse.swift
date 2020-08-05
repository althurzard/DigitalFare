//
//  DirectionResponse.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import CPAPIService

public struct DirectionResponse: BaseModel {
    public var geocodedWaypoints   : [Waypoint]?
    public var routes              : [Route]?
    public var status              : String?
    
    enum CodingKeys: String, CodingKey {
        case geocodedWaypoints = "geocoded_waypoints"
        case routes
        case status
    }
}
