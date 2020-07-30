//
//  ApiRequest.swift
//  demo map ios
//
//  Created by MLGT01 on 6/25/20.
//  Copyright © 2020 MLGT. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import CoreLocation

public class APIService {
    public static func getInfo(listLocation: [CLLocationCoordinate2D], interpolate: Bool, indexCall: Int, done: @escaping(_ result: SnappedPoint?,_ errorString: String?, _ indexCall: Int) -> ()) {
        let router = Router.snapToRoad(location: listLocation, interpolate: interpolate)
        
        AF.request(router).responseObject { (response: DataResponse<SnappedPoint,AFError>) in
            switch response.result {
            case .success(let data):
                done(data, nil, indexCall)
            case .failure(let error):
                done(nil, error.localizedDescription, indexCall)
            }
        }
    }
    
    public static func getDirection(startLocation: CLLocationCoordinate2D, stopLocation: CLLocationCoordinate2D, done: @escaping(_ result: DirectionResponse?, _ errorString: String?) -> ()) {
        let router = Router.directions(startLocation: startLocation, stopLocation: stopLocation)
        AF.request(router).responseObject { (response: DataResponse<DirectionResponse, AFError>) in
            switch response.result {
            case .success(let data):
                print(data)
                done(data, nil)
            case .failure(let error):
                done(nil, error.localizedDescription)
            }
        }
    }
    
    public static func getGeocoding(address: String, done: @escaping(_ result: GeocodingResponse?,_ errorString: String?) -> ()) {
        let router = Router.addressToCoordidate(address: address)
        AF.request(router).responseObject { (response: DataResponse<GeocodingResponse,AFError>) in
                       switch response.result {
                       case .success(let data):
                           done(data,nil)
                        print(data)
                       case .failure(let error):
                           done(nil, error.localizedDescription)
                       }
               }
    }
}
