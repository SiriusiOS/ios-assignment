//
//  CitiesDataSource.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
import UIKit
protocol CitiesDataSource: IBaseDataSource {
    
    func attach(_ tableView: UITableView)
    func setDataSource(items: [CityEntity])
    func addDataSource(items: CityEntity...)
}
