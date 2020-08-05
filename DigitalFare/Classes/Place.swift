//
//  Place.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/29/20.
//

import Foundation
import CPAPIService
import CoreLocation

public struct Place: BaseModel {
    
    public var location: Location?
    public var originalIndex: Int?
    public var placedId: String?
    
    public init() {}
}
