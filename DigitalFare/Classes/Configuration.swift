//
//  Config.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/28/20.
//

import Foundation

public class DigitalFare {
    public static let shared = DigitalFare()
    private init() { }
    public var apiKey = APIKey()
}

