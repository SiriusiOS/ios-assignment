//
//  CitiesDataSourceImpl.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import UIKit
class CitiesDataSourceImpl: BaseDataSource, CitiesDataSource {
    weak var tableView: UITableView?
    var dataSource: [CityEntity] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    func attach(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CityItemCell.nib, forCellReuseIdentifier: CityItemCell.identify)
        self.tableView = tableView
    }
    
    func setDataSource(items: [CityEntity]) {
        dataSource = items
    }
    
    func addDataSource(items: CityEntity...) {
        dataSource.append(contentsOf: items)
    }
    
}

extension CitiesDataSourceImpl: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityItemCell.identify) as? CityItemCell else {
            fatalError()
        }
        cell.setUI(data: dataSource[indexPath.row])
        return cell
    }
    
}
extension CitiesDataSourceImpl: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelected?(dataSource[indexPath.row])
    }
}
