//
//  Dependencies.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
let AppDependencies = Dependencies.instance
class Dependencies {
    static var instance: Dependencies = Dependencies()
    lazy var internalConfiguration:Configuration = {
        return Configuration()
    }()
    lazy var apiClient: ApiClient = {
        return ApiClientImpl(configuration: internalConfiguration)
    }()
    lazy var cityApi: CityApi = CityApiImpl(apiClient: apiClient)
    lazy var cityRepo: CityRepository = CityRepositoryImpl(cityApi: cityApi)
    lazy var cityStore: CityStorage = CityStorageImpl(cityRepo: cityRepo)
}

