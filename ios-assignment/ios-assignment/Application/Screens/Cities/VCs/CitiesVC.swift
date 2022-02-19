//
//  CitiesVC.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import UIKit

class CitiesVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var dataSource: CitiesDataSource!
    var viewModel: CitiesViewModel!
    var didGetCities: (([CityEntity]) -> Void)?
    var didSelectesCity: ((CityEntity) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func setupUI() {
        searchBar.delegate = self
    }
    override func setupConfig() {
        super.setupConfig()
        if self.splitViewController != nil {

        }
        dataSource.attach(tableView)
        dataSource.didSelected = { city in
            if let item = city as? CityEntity {
                if self.splitViewController != nil {
                    self.didSelectesCity?(item)
                } else {
                    AppNavigator.showCityDeatil(city: item)
                }
            }
        }
    }
    override func setupViewModel() {
        super.setupViewModel()
        viewModel.didGetCities = { cities in
            self.dataSource.setDataSource(items: cities)
            self.didGetCities?(cities)
        }
    }
    override func setupData() {
        viewModel.getCities()
    }
}

extension CitiesVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchCities(text: searchText)
    }
}
