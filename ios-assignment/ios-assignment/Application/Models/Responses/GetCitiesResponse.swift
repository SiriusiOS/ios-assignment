//
//  GetCitiesResponse.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
struct GetCitiesResponse: Codable {
    
    var cities: [CityEntity]

    init(from decoder: Decoder) throws {

        var container = try decoder.unkeyedContainer()

        var elements = [CityEntity]()
        if let count = container.count {
            elements.reserveCapacity(count)
        }

        while !container.isAtEnd {
            let element = try container
                .decode(CityEntity.self)
            
            elements.append(element)
            
        }

        self.cities = elements
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(cities)
    }
}
