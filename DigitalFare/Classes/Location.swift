//
//  Location.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import CPAPIService
import CoreLocation

public struct Location: BaseModel {
    public var lat: Double?
    public var lng: Double?
    var to2DLocation: CLLocationCoordinate2D {
        var object: CLLocationCoordinate2D = CLLocationCoordinate2D()
        object.latitude = self.lat ?? 0
        object.longitude = self.lng ?? 0
        return object
    }
    
    enum CodingKeys: String, CodingKey {
        case lat
        case lng
        case latitude
        case longitude
    }
    
    public init() {}
    
}

extension Location {
    
    
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lat = try? container.decodeIfPresent(Double.self, forKey: .lat) ?? (try? container.decodeIfPresent(Double.self, forKey: .latitude))
        lng = try? container.decodeIfPresent(Double.self, forKey: .lng) ?? (try? container.decodeIfPresent(Double.self, forKey: .longitude))
    }
    
    public func encode(to encoder: Encoder) throws {
        
    }
}
