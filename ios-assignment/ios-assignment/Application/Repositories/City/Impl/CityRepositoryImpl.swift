//
//  CityRepositoryImpl.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
class CityRepositoryImpl: CityRepository {
    let cityApi: CityApi!
    init(cityApi: CityApi) {
        self.cityApi = cityApi
    }
    func getCities(params: GetCitiesParams, completed: ((GetCitiesResponse?, ApiError?) -> Void)?) {
        cityApi.getCities(params: params) { response in
            let res: GetCitiesResponse? = response.converTo()
            completed?(res, response.error)
        }
    }
}
