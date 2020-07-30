//
//  CalculateUtils.swift
//  demo map ios
//
//  Created by MLGT01 on 7/10/20.
//  Copyright © 2020 MLGT. All rights reserved.
//

import UIKit
import CoreLocation

public class Utils {
    static func getDistance(listCLLocation2D: [CLLocationCoordinate2D]) -> Double {
        var distance: Double = 0
        if listCLLocation2D.count < 2 { return 0 }
        for index in 0...(listCLLocation2D.count - 2) {
            let firstObject = listCLLocation2D[index]
            let locationFirst = CLLocation(latitude: firstObject.latitude, longitude: firstObject.longitude)
            let lastObject = listCLLocation2D[index + 1]
            let locationLast = CLLocation(latitude: lastObject.latitude, longitude: lastObject.longitude)
            distance += locationLast.distance(from: locationFirst)
        }
        return distance
    }
    
    static func getPrice(from distance: Double, config: Settings, isRoundedToThousand: Bool = false) -> Double {
        var price:Double = config.firstPrice
        var distanceRemainting = distance - 300
        if distance <= 300 {
            return price
        }
        if distance > 2000 {
            price += 1.7 * config.secondPriceFromNextKm
            
        } else {
            price += (distanceRemainting / 1000) * config.secondPriceFromNextKm
        }
        distanceRemainting -= 1700
        distanceRemainting = distanceRemainting >= 0 ? distanceRemainting : 0
        if distance > 10000 {
            price += 8 * config.thirdPriceFromNext10Km
        } else {
            price += (distanceRemainting / 1000) * config.thirdPriceFromNext10Km
        }
        distanceRemainting -= 8000
        distanceRemainting = distanceRemainting >= 0 ? distanceRemainting : 0
        if distance > 25000 {
            price += 15 * config.fourthPriceFrom11To25Km
        } else {
            price += (distanceRemainting / 1000) * config.fourthPriceFrom11To25Km
        }
        distanceRemainting -= 15000
        distanceRemainting = distanceRemainting >= 0 ? distanceRemainting : 0
        price += (distanceRemainting / 1000) * config.fifthPriceAbove25Km
        if isRoundedToThousand {
            price = (price/1000).rounded() * 1000
        }
        return price
    }
    
    static func polyLine(with encodedString: String) -> [CLLocationCoordinate2D] {
        var myRoutePoints=[CLLocationCoordinate2D]()
        let bytes = (encodedString as NSString).utf8String
        var idx: Int = 0
        var latitude: Double = 0
        var longitude: Double = 0
        while (idx < encodedString.lengthOfBytes(using: String.Encoding.utf8)) {
            var byte = 0
            var res = 0
            var shift = 0
            repeat {
                byte = Int(bytes![idx] - 63)
                idx += 1
                res |= (byte & 0x1F) << shift
                shift += 5
            } while (byte >= 0x20)
            let deltaLat = ((res & 1) != 0x0 ? ~(res >> 1) : (res >> 1))
            latitude += Double(deltaLat)

            shift = 0
            res = 0
            repeat {
                byte = Int(bytes![idx] - 63)
                idx += 1
                res |= (byte & 0x1F) << shift
                shift += 5
            } while (byte >= 0x20)
            let deltaLon = ((res & 1) != 0x0 ? ~(res >> 1) : (res >> 1))
            longitude += Double(deltaLon)

            myRoutePoints.append(CLLocation(latitude: Double(latitude * 1E-5), longitude: Double(longitude * 1E-5)).coordinate)
        }
        return myRoutePoints
    }
}
