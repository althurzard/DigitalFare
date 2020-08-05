//
//  Config.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/28/20.
//

import Foundation
import DigitalFareUtils

public class DigitalFare {
    public static let shared = DigitalFare()
    private init() { }
    
    public var settings = Settings()
    
    public var apiKey = APIKey()
    
}
