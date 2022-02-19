//
//  CitiesModel.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
import MapKit
class CitiesModel {
    var cities: [CityEntity] = []
}
class CityAnnotation: NSObject, MKAnnotation {
    var entry: CityEntity!
    init(entry: CityEntity) {
        self.entry = entry
        super.init()
    }
    var title: String? {
        return "\(entry.name), \(entry.country)"
    }
    var subtitle: String? {
        return "\(entry.coord.lon), \(entry.coord.lat)"
    }
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: entry.coord.lat, longitude: entry.coord.lon)
    }
}
