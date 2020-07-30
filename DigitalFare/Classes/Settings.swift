//
//  Settings.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/28/20.
//

import Foundation

public struct Settings {
    public var minimumDistanceToGetLocation    : Double = 0
    public var maxRequestPerLocation     : Int = 10
    //Mở Cửa
    public var firstPrice                    : Double = 0
    // <2
    public var secondPriceFromNextKm                   : Double = 0
    // 2->10
    public var thirdPriceFromNext10Km                   : Double = 0
    // 11->25
    public var fourthPriceFrom11To25Km                   : Double = 0
    // >26
    public var fifthPriceAbove25Km                    : Double = 0
    public var limitTimePerKm               : Int = 0
    public var waitingPrice                 : Double = 0
    public var freeWaitingMinute             : Int = 0
}
