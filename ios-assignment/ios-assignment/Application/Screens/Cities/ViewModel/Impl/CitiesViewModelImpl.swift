//
//  CitiesViewModelImpl.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
class CitiesViewModelImpl: BaseViewModel, CitiesViewModel {
    var model: CitiesModel
    var didGetCities: (([CityEntity]) -> Void)?
    let citiStore: CityStorage!
    init(model: CitiesModel, citiStore: CityStorage) {
        self.citiStore = citiStore
        self.model = model
        super.init()
    }
    
    
    func getCities() {
        citiStore.getCities(params: GetCitiesParams()) { cities, error in
            self.model.cities = cities ?? []
            self.didGetCities?(cities ?? [])
        }
    }
    
    func searchCities(text: String) {
        citiStore.searchCities(params: SearchCityParams(text: text)) { cities, error in
            self.didGetCities?(cities ?? [])
        }
    }
    
}
