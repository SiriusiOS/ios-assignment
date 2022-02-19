//
//  CitiesVC.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import UIKit

final class CitiesVC: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var dataSource: CitiesDataSource!
    var viewModel: CitiesViewModel!
    var didGetCities: (([CityEntity]) -> Void)?
    var didSelectesCity: ((CityEntity) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func setupUI() {
        searchBar.delegate = self
        title = "Cities"
    }
    override func setupConfig() {
        super.setupConfig()
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
            Spinner.shared.dismissLoading()
            self.dataSource.setDataSource(items: cities)
            self.didGetCities?(cities)
        }
    }
    override func setupData() {
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        Spinner.shared.showLoading(inView: window)
        viewModel.getCities()
    }
}

//MARK: - UISearchBarDelegate
extension CitiesVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchCities(text: searchText)
    }
}
