//
//  ApiClient.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 17/02/2022.
//

import Foundation
protocol ApiClient {
    func request(method: HttpMethod,
                               url: String,
                               parameters: [String: String]?,
                               headers: [String: String]?,
                               bodyData: [String: Any]?,
                               completed: @escaping (ApiResponse) -> Void)
    
    func get(url: String,
                           parameters: [String : String]?,
                           headers:[String:String]?,
                           completed: @escaping (ApiResponse) -> Void)
    
    func post(url: String,
                            parameters: [String : String]?,
                            headers:[String:String]?,
                            bodyData: [String: Any]?,
                            completed: @escaping (ApiResponse) -> Void)
    
    func put(url: String,
                           parameters: [String : String]?,
                           headers:[String:String]?,
                           bodyData: [String: Any]?,
                           completed: @escaping (ApiResponse) -> Void)
    
    func delete(url: String,
                              parameters: [String : String]?,
                              headers:[String:String]? ,
                              bodyData: [String: Any]?,
                              completed: @escaping (ApiResponse) -> Void)
    
    func patch(url: String,
                             parameters: [String : String]?,
                             headers:[String:String]?,
                             bodyData: [String: Any]?,
                             completed: @escaping (ApiResponse) -> Void)
    
}
enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case path = "PATH"
    // Define more if need
}
class ApiResponse {
    var error: ApiError?
    var errorCode: String?
    var data: Any?
    init(error: ApiError) {
        self.error = error
    }
    init(data: Any?) {
        // edit after
        self.data = data
    }
    func converTo<T: Codable>() -> T? {
        if let data = data {
            return try? JSONDecoder().decode(T.self, from: JSONSerialization.data(withJSONObject: data, options: []))
        }
        return nil
    }
    func converToList<T: Codable>() -> [T]? {
        do {
            if let data = data {
                return try PropertyListDecoder().decode([T].self, from: JSONSerialization.data(withJSONObject: data, options: []))
            }
            return nil

        } catch let e {
            print(e)
            return nil
        }
        
    }
}
struct ApiError {
    var message: String?
}

class HeaderRequestHelper {
    private let token:String
    init(_ token:String) {
        self.token = token
    }

    func build() -> [String:String] {
        let headers = [
            "Authorization": "Bearer \(token)",
            "Content-Type":"application/json",
            "client-type": "ios",
        ]
        return headers
    }
    
    static func builder(with token:String?) -> [String:String] {
        var headers = [
            "Content-Type":"application/json",
            "client-type": "ios",
        ]
        if let tk = token {
            headers["Authorization"] = "Bearer \(tk)"
            headers["X-Amaz-Authorization"] = "Bearer \(tk)"
        }
        return headers
    }
    
    static func bearerToken(token: String) -> String {
        return "Bearer \(token)"
    }
}
