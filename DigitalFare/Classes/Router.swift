//
//  Router.swift
//  demo map ios
//
//  Created by MLGT01 on 6/25/20.
//  Copyright © 2020 MLGT. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation


public enum Router: URLRequestConvertible {
    var googleApiKey: String {
        get {
            switch self {
            case .snapToRoad, .directions:
                return DigitalFare.shared.apiKey.googleMap
            case .addressToCoordidate:
                return DigitalFare.shared.apiKey.googleMap
            }
        }
    }
    var baseUrlString: String {
        get {
            switch  self {
            case .snapToRoad:
                return "https://roads.googleapis.com/v1"
            case .directions, .addressToCoordidate:
                return "https://maps.googleapis.com/maps/api"
            }
        }
    }
    
    // ==== Begin Define API ====
    case snapToRoad(location:[CLLocationCoordinate2D], interpolate: Bool)
    case directions(startLocation: CLLocationCoordinate2D, stopLocation: CLLocationCoordinate2D)
    case addressToCoordidate(address: String)
    // ==== End of Define API ====
    
    // MARK: - METHOD
    var method: HTTPMethod {
        switch  self {
        case .snapToRoad:
            return .post
        case .directions:
            return .post
        case .addressToCoordidate:
            return .get
        }
    }
    
    // MARK: - PATH
    var path: String {
        switch self {
        case .snapToRoad:
            return "/snapToRoads"
        case .directions:
            return "/directions/json"
        case .addressToCoordidate:
            return "/geocode/json"
        }
    }
    
    // MARK: - Headers
    private var headers: HTTPHeaders {
        var headersDictionary = ["Accept": "application/json"]
        headersDictionary["Content-Type"] = "application/json"
        let headers = HTTPHeaders(headersDictionary)
        return headers
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .snapToRoad(let path, let interpolate):
            var pathString = ""
            for location in path {
                let locationString = "\(location.latitude), \(location.longitude)| "
                pathString.append(locationString)
            }
            pathString.removeLast(2)
            return ["path": pathString,
                    "interpolate": interpolate,
                    "key": googleApiKey]
        case .directions(let startLocation, let stopLocation):
            let startLocString = "\(startLocation.latitude),\(startLocation.longitude)"
            let stopLocString = "\(stopLocation.latitude),\(stopLocation.longitude)"
            return ["origin": startLocString,
                    "destination": stopLocString,
                    "key": googleApiKey]
        case .addressToCoordidate(let address):
            return ["address": address,
                    "key": googleApiKey]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try baseUrlString.asURL()
        // setting parameter
        
        // setting path
        var urlRequest: URLRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // setting method
        urlRequest.httpMethod = method.rawValue
    
        // setting header
        for (key, value) in headers.dictionary {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
    //        if let parameters = parameters {
    //            do {
    //                let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
    //                urlRequest.httpBody = jsonData
    //                print(parameters)
    //            } catch {
    //                print("Encoding fail")
    //            }
    //        }
        switch self {
        default:
            urlRequest = try Alamofire.URLEncoding.queryString.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
}
