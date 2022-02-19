//
//  BaseVC.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 18/02/2022.
//

import UIKit
class BaseVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfig()
        setupUI()
        setupViewModel()
        setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadDataOnUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupUI() {
    }
    
    func setupViewModel() {
        //Will implement at child VC
    }
    
    func setupConfig() {
        //Will implement at child VC
    }
    func setupData() {
        
    }
    func reloadDataOnUI() {
        //Will implement at child VC
    }
    
    func showLoading() {
    }
    
    func hideLoading() {
        
    }
}
