//
//  Waypoint.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import CPAPIService

public struct Waypoint: BaseModel {
    public var geoCoderStatus : String?
    public var placeId        : String?
    public var types          : [String]?
    
    enum CodingKeys: String, CodingKey{
        case geoCoderStatus = "geocoder_status"
        case placeId = "place_id"
        case types
    }
    
    public init() {
        
    }
}
