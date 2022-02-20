//
//  Configuration.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 17/02/2022.
//

import Foundation
class Configuration {
    private let apiVersion = "/SiriusiOS/ios-assignment"
    private let devURL = "https://raw.githubusercontent.com"
    var baseURL:String

    init() {
        baseURL = self.devURL + apiVersion
    }
}
