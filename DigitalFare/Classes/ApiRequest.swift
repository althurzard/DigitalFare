//
//  ApiRequest.swift
//  demo map ios
//
//  Created by MLGT01 on 6/25/20.
//  Copyright © 2020 MLGT. All rights reserved.
//

import UIKit
import CPAPIService
import CoreLocation

public class DFService {
    public static func getInfo(listLocation: [Location], interpolate: Bool, indexCall: Int, completion: @escaping (FetchedResult<SnappedPoint,ServiceError>) -> Void ) {
        var pathString = listLocation
            .filter { $0.lat != nil && $0.lng != nil }
            .map { "\($0.lat!), \($0.lng!)| "}
            .joined()
        pathString.removeLast(2)
        let input = DFInputService(
            name: "https://roads.googleapis.com/v1/snapToRoads",
            params: ["path": pathString,
                     "interpolate": interpolate,
                     "key": DigitalFare.shared.apiKey.googleMap],
            requestType: .get)
        
        APIService.request(input: input, output: DFOutputService.self, completion: completion)
    }
    
    public static func getDirection(startLocation: Location, stopLocation: Location, completion: @escaping (FetchedResult<DirectionResponse,ServiceError>) -> Void) {
        let input = DFInputService(
            name: "https://maps.googleapis.com/maps/api/directions/json",
            params: ["origin": "\(startLocation.lat ?? 0),\(startLocation.lng ?? 0)",
                     "destination": "\(stopLocation.lat ?? 0),\(stopLocation.lng ?? 0)",
                     "key": DigitalFare.shared.apiKey.googleMap],
            requestType: .get)
        APIService.request(input: input, output: DFOutputService.self, completion: completion)
    }
    
    public static func getGeocoding(address: String, completion: @escaping (FetchedResult<GeocodingResponse,ServiceError>) -> Void) {
        let input = DFInputService(
            name: "https://maps.googleapis.com/maps/api/geocode/json",
            params: ["address": address,
                     "key": DigitalFare.shared.apiKey.googleMap],
            requestType: .get)
        APIService.request(input: input, output: DFOutputService.self, completion: completion)
    }
}
