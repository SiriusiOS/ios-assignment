//
//  BaseApiClient.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import Foundation
class BaseApiClient {
    let apiClient: ApiClient!
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
}
