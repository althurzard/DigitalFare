//
//  RoutePoint.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import CPAPIService


public struct Route: BaseModel {
    public var overviewPolyline : String?
    
    enum OverViewKeys: String, CodingKey {
        case overview = "overview_polyline"
    }
    
    enum CodingKeys: String, CodingKey {
        case overviewPolyline = "points"
    }
    public init() {}
}


extension Route {
    public init(from decoder: Decoder) throws {
        let overview = try decoder.container(keyedBy: OverViewKeys.self)
        let overviewContainer = try overview.nestedContainer(keyedBy: CodingKeys.self, forKey: .overview)
        overviewPolyline = try overviewContainer.decodeIfPresent(String.self, forKey: .overviewPolyline)
    }
}
