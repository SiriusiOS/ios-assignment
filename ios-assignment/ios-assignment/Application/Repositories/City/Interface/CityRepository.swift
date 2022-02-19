//
//  CityRepository.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
protocol CityRepository {
    func getCities(params: GetCitiesParams, completed: ((GetCitiesResponse?, ApiError?) -> Void)?)
}
