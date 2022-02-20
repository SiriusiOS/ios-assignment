//
//  ApiClientImpl.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 17/02/2022.
//

import Foundation
class ApiClientImpl: ApiClient {
    let configuration: Configuration!
    init(configuration:Configuration) {
        self.configuration = configuration
    }
    private func internalRequest(path: String, method: HttpMethod, parameters: [String: String]?, headers: [String: String]?, bodyData: [String: Any]? = nil, completed: @escaping (ApiResponse) -> Void) {
        var url = URLComponents(url: URL(string: configuration.baseURL + path)!, resolvingAgainstBaseURL: true)
        url?.queryItems = parameters?.compactMap({return URLQueryItem(name: $0.key, value: $0.value)})
        var request = URLRequest(url: url!.url!, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 30)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        if method != .get {
            request.httpBody = try?JSONSerialization.data(withJSONObject: bodyData ?? [:], options: [])
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                completed(ApiResponse(data: try? JSONSerialization.jsonObject(with: data, options: [])))
            } else {
                completed(ApiResponse(error: ApiError(message: error?.localizedDescription ?? "")))
            }
        }.resume()
    }
    func request(method: HttpMethod, url: String, parameters: [String : String]?, headers: [String : String]?, bodyData: [String : Any]?, completed: @escaping (ApiResponse) -> Void) {
        self.internalRequest(path: url, method: method, parameters: parameters, headers: headers, bodyData: bodyData, completed: completed)
    }
    
    func get(url: String, parameters: [String : String]?, headers: [String : String]?, completed: @escaping (ApiResponse) -> Void) {
        self.request(method: .get, url: url, parameters: parameters, headers: headers, bodyData: nil, completed: completed)
    }
    
    func post(url: String, parameters: [String : String]?, headers: [String : String]?, bodyData: [String : Any]?, completed: @escaping (ApiResponse) -> Void) {
        self.request(method: .post, url: url, parameters: parameters, headers: headers, bodyData: bodyData, completed: completed)
    }
    
    func put(url: String, parameters: [String : String]?, headers: [String : String]?, bodyData: [String : Any]?, completed: @escaping (ApiResponse) -> Void) {
        self.request(method: .put, url: url, parameters: parameters, headers: headers, bodyData: bodyData, completed: completed)
    }
    
    func delete(url: String, parameters: [String : String]?, headers: [String : String]?, bodyData: [String : Any]?, completed: @escaping (ApiResponse) -> Void) {
        self.request(method: .delete, url: url, parameters: parameters, headers: headers, bodyData: bodyData, completed: completed)
    }
    
    func patch(url: String, parameters: [String : String]?, headers: [String : String]?, bodyData: [String : Any]?, completed: @escaping (ApiResponse) -> Void) {
        self.request(method: .path, url: url, parameters: parameters, headers: headers, bodyData: bodyData, completed: completed)
    }
    
}
