//
//  GeocodingResponse.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import ObjectMapper
import CoreLocation
public struct GeocodingResponse: Mappable {
    var results: [GeocodingResult] = []
    
    public init?(map: Map) {
        mapping(map: map)
    }
    
    public mutating func mapping(map: Map) {
        results <- map["results"]
    }
    
}

public struct GeocodingResult: Mappable {
    public init?(map: Map) {
        mapping(map: map)
    }
    
    var formattedAddress: String?
    var placeId: String?
    var location: Location?
    
    public mutating func mapping(map: Map) {
      
        formattedAddress <- map["formatted_address"]
        placeId <- map["place_id"]
        location <- map["geometry.location"]
    }
    
    
}
