//
//  SnappedPoint.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import ObjectMapper
import CoreLocation

struct SnappedPoint: Mappable {
    var places: [Place]?
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        places <- map["snappedPoints"]
    }
    
    func getList2DLocation() -> [CLLocationCoordinate2D] {
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
