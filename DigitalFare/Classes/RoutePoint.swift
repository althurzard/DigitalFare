//
//  RoutePoint.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import ObjectMapper


public struct Route: Mappable {
    var overviewPolyline : String?
    public init?(map: Map) {
        mapping(map: map)
    }
    
    public mutating func mapping(map: Map) {
        overviewPolyline <- map["overview_polyline.points"]
    }
    
    
}
