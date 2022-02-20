//
//  BaseDataSource.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
class BaseDataSource: NSObject, IBaseDataSource {
    var didSelected: ((Any) -> Void)?
}
