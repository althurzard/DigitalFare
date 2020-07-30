//
//  Location.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import ObjectMapper
import CoreLocation

public struct Location: Mappable {
    public var lat: Double?
    public var lng: Double?
    var to2DLocation: CLLocationCoordinate2D {
        var object: CLLocationCoordinate2D = CLLocationCoordinate2D()
        object.latitude = self.lat ?? 0
        object.longitude = self.lng ?? 0
        return object
    }
    
    
    public init?(map: Map) {
        mapping(map: map)
    }
    
    public mutating func mapping(map: Map) {
        lat            <- map["latitude"]
        lng             <- map["longitude"]
        if (lat == nil) {
            lat            <- map["lat"]
            lng             <- map["lng"]
        }
    }
    
    
}
