//
//  DFOutputService.swift
//  DigitalFare
//
//  Created by Nguyen Quoc Vuong on 8/5/20.
//

import Foundation
import CPAPIService
import Alamofire

class DFOutputService: APIOutputBase {
    var response: DataResponse<Any>!
    lazy var errorData: Any? = {
        let result = response.result
        if let dict = result.value as? [String: Any] {
            return dict
        }
        return nil
    }()
    
    var output: FetchedResult<Data,ServiceError> {
        if let error = response?.error {
            return .failure(.message(error.localizedDescription))
        } else if let data = response?.data {
            return .success(data)
        } else {
            return .failure(.message("Error"))
        }
    }
    
    required init(response: DataResponse<Any>) {
        self.response = response
    }
    
    
}

