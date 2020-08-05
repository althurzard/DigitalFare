//
//  SnappedPoint.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import CPAPIService
import CoreLocation

public struct SnappedPoint: BaseModel {
    public var places: [Place]?
    
    enum CodingKeys: String, CodingKey {
        case places = "snappedPoints"
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
    
    public init() {
        
    }
}
