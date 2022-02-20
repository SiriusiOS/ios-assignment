//
//  CityStorage.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
protocol CityStorage {
    func getCities(params: GetCitiesParams, completed: (([CityEntity]?, ApiError?)-> Void)?)
    func searchCities(params: SearchCityParams, completed: (([CityEntity]?, ApiError?)-> Void)?)
}
