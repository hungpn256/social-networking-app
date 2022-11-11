//
//  APIRequest.swift
//  chatapp
//
//  Created by HungPN on 11/11/2022.
//

import Foundation

enum HTTPRequest: String{
    case POST, GET, PUT, DELETE
}

class ApiRequest{
    func call<T>(url: String, method: HTTPRequest, parameters: [String: Any], completed: @escaping ((Result<T, Error>) -> Void) ){
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        urlRequest.setValue("authorization", forHTTPHeaderField: UserDefaults.standard.string(forKey: AppContant.token) ?? "")
    }
}
