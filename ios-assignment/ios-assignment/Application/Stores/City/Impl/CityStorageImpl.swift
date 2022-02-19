//
//  CityStorageImpl.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
class CityStorageImpl: CityStorage {
    let cityRepo: CityRepository!
    var cities: [CityEntity]?
    init(cityRepo: CityRepository) {
        self.cityRepo = cityRepo
    }
    func getCities(params: GetCitiesParams, completed: (([CityEntity]?, ApiError?) -> Void)?) {
        if let cities = cities, !cities.isEmpty {
            completed?(cities, nil)
        } else {
            cityRepo.getCities(params: params) { response, error in
                self.cities = response?.cities.sorted(by: {$0.name.lowercased() < $1.name.lowercased()})
                completed?(self.cities, error)
            }
        }
    }
    func searchCities(params: SearchCityParams, completed: (([CityEntity]?, ApiError?) -> Void)?) {
        guard !params.text.isEmpty else {
            completed?(cities, nil)
            return
        }
        let _cities = cities?
            .filter({$0.name.contains(params.text) || $0.country.contains(params.text)})
            .sorted(by: {$0.name.lowercased() < $1.name.lowercased()})
        completed?(_cities, nil)
    }
}
