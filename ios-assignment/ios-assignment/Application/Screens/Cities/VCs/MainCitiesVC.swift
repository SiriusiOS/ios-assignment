//
//  MainCitiesVC.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import UIKit

class MainCitiesVC: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.preferredDisplayMode = .oneBesideSecondary

        if let leftNavController = viewControllers.first as? UINavigationController,
           let masterViewController = leftNavController.viewControllers.first as? CitiesVC,
           let detailViewController = viewControllers.last as? CityVC ?? (viewControllers.last as? UINavigationController)?.topViewController as? CityVC
         {
            masterViewController.viewModel = CitiesViewModelImpl(model: CitiesModel(), citiStore: AppDependencies.cityStore)
            masterViewController.dataSource = CitiesDataSourceImpl()
            masterViewController.didGetCities = { cities in
                if detailViewController.city == nil {
                    detailViewController.city = cities.first
                }
            }
            masterViewController.didSelectesCity = { city in
                detailViewController.city = city
                self.showDetailViewController(detailViewController, sender: nil)
            }
            
        }
    }

}

extension MainCitiesVC: UISplitViewControllerDelegate {
    func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
        return .primary
    }

}
