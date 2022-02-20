//
//  IBaseDataSource.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
protocol IBaseDataSource {
    var didSelected: ((Any) -> Void)? {get set}
}
