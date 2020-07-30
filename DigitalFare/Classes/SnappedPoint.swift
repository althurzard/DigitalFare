//
//  SnappedPoint.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import ObjectMapper
import CoreLocation

public struct SnappedPoint: Mappable {
    public var places: [Place]?
    
    public init?(map: Map) {
        mapping(map: map)
    }
    
    public mutating func mapping(map: Map) {
        places <- map["snappedPoints"]
    }
    
    public func getList2DLocation() -> [CLLocationCoordinate2D] {
        var listLocation : [CLLocationCoordinate2D] = []
        if let places = places {
            for item in places {
                if let location = item.location?.to2DLocation {
                    listLocation.append(location)
                }
            }
        }
        return listLocation
    }
}
