//
//  CityEntity.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
// MARK: - CityEntity
struct CityEntity: Codable {
    let country, name: String
    let id: Int
    let coord: Coord

    enum CodingKeys: String, CodingKey {
        case country, name
        case id = "_id"
        case coord
    }
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}
