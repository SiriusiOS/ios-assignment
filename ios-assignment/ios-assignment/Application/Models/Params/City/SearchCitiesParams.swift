//
//  SearchCitiesParams.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
struct SearchCityParams: BaseParams {
    var text: String
    func toJSON() -> [String : Any] {
        return [:]
    }
    
    func toParams() -> [String : String] {
        return [:]
    }
}
