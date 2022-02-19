//
//  CitiApiImpl.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
class CityApiImpl: BaseApiClient, CityApi {
    let citiesPath = "/main/cities.json"
    func getCities(params: GetCitiesParams, completed: @escaping (ApiResponse) -> Void) {
        apiClient.get(url: citiesPath, parameters: params.toParams(), headers: nil, completed: completed)
    }
}
