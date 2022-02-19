//
//  CityVC.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import UIKit
import MapKit
class CityVC: BaseVC {

    @IBOutlet weak var mapView: MKMapView!
    var city: CityEntity? {
        didSet {
            guard let city = city, mapView != nil else {return}
            DispatchQueue.main.async {
                self.mapView.centerToLocation(CLLocation(latitude: city.coord.lat, longitude:city.coord.lon), regionRadius: 1000)
                let artwork = CityAnnotation(entry: city)
                self.mapView.addAnnotation(artwork)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
