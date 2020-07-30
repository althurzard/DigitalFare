//
//  Settings.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/28/20.
//

import Foundation

public struct Settings {
    var minimumDistanceToGetLocation    : Double = 0
    var maxRequestPerLocation     : Int = 10
    //Mở Cửa
    var firstPrice                    : Double = 0
    // <2
    var secondPriceFromNextKm                   : Double = 0
    // 2->10
    var thirdPriceFromNext10Km                   : Double = 0
    // 11->25
    var fourthPriceFrom11To25Km                   : Double = 0
    // >26
    var fifthPriceAbove25Km                    : Double = 0
    var limitTimePerKm               : Int = 0
    var waitingPrice                 : Double = 0
    var freeWaitingMinute             : Int = 0
}
