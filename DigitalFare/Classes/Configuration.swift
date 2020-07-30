//
//  Config.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/28/20.
//

import Foundation


public class DigitalFare {
    static let shared = DigitalFare()
    private init() { }
    
    var settings = Settings()
    
    var apiKey = APIKey()
    var host = HostService()
    
}
