//
//  CitiesViewModel.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
protocol CitiesViewModel: IBaseViewModel {
    var model: CitiesModel {get set}
    var didGetCities: (([CityEntity]) -> Void)? {get set}
    func getCities()
    func searchCities(text: String)
}
