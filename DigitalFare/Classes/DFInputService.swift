//
//  DFInputService.swift
//  DigitalFare
//
//  Created by Nguyen Quoc Vuong on 8/5/20.
//

import Foundation
import CPAPIService
import Alamofire

class DFInputService: APIInputBase {
    var headers: HTTPHeaders = [
        "Content-Type" : "application/json",
        "Accept" : "application/json",
    ]
    var baseURL: String = ""
    var name: String = ""
    var params: Parameters = [:]
    var requestType: HTTPMethod = .get {
        didSet {
            encoding = (requestType == .get || requestType == .delete) ? URLEncoding.default : JSONEncoding.default
        }
    }
    var encoding: ParameterEncoding = URLEncoding.default
    var data: Data?
    var returnErrorData: Bool = false
    
    init(name: String = "", params: Parameters = [:], requestType: HTTPMethod = .get) {
        self.name = name
        self.params = params
        self.requestType = requestType
    }
    
    
}
