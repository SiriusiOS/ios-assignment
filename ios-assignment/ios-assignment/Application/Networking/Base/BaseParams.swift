//
//  BaseParams.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
protocol BaseParams {
    func toJSON() -> [String: Any]
    func toParams() -> [String: String]
}
