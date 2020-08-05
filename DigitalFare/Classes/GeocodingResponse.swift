//
//  GeocodingResponse.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import CPAPIService
import CoreLocation

public struct GeocodingResponse: BaseModel {
    public var results: [GeocodingResult]
}

public struct GeocodingResult: BaseModel {
    
    public var formattedAddress: String?
    public var placeId: String?
    public var location: Location?
    
    enum GeometryKeys: String, CodingKey {
        case geometry
    }
    
    enum CodingKeys: String, CodingKey {
        case formattedAddress = "formattedAddress"
        case placeId = "place_id"
        case location
    }
}

extension GeocodingResult {
    public init(from decoder: Decoder) throws {
        let geometry = try decoder.container(keyedBy: GeometryKeys.self)
        let geometryContainer = try geometry.nestedContainer(keyedBy: CodingKeys.self, forKey: .geometry)
        location = try geometryContainer.decodeIfPresent(Location.self, forKey: .location)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        placeId = try container.decodeIfPresent(String.self, forKey: .placeId)
        formattedAddress = try container.decodeIfPresent(String.self, forKey: .formattedAddress)
    }
}
