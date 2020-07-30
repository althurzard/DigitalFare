//
//  Helper.swift
//  digital-fare-lib
//
//  Created by Nguyen Quoc Vuong on 7/28/20.
//

import Foundation

/// Chờ một khoảng thời gian và thực thi block của closure
/// - parameter delay: khoảng thời gian chờ
/// - parameter closure: block code được thực thi sau khoảng thời gian chờ
public func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

