//
//  CitiApi.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
protocol CityApi {
    func getCities(params: GetCitiesParams, completed: @escaping (ApiResponse) -> Void)
}
