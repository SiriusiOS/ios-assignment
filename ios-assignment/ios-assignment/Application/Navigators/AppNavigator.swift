//
//  AppNavigator.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
import UIKit
let AppNavigator = NavigatorManager.shared
class NavigatorManager {
    static let shared = NavigatorManager(navi: UINavigationController())
    var currentNavi: UINavigationController!
    init(navi: UINavigationController) {
        self.currentNavi = navi
    }
    
    func initRoot() -> UIViewController {
        let vc: MainCitiesVC = StoryBoard.main.controller()
        return vc
    }
    
    func showCityDeatil(city: CityEntity) {
        
    }
}
