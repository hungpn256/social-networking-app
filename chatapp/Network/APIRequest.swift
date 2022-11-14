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
    func call<T: Codable>(_ url: String, _ method: HTTPRequest, _ parameters: [String: Any], _ expectedModel: T.Type, _ completed: @escaping ((Result<T, Error>) -> Void) ){
        print(url)
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = method.rawValue
        if(method != .GET){
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        print(UserDefaults.standard.string(forKey: AppContant.token))
        urlRequest.setValue(UserDefaults.standard.string(forKey: AppContant.token) ?? "", forHTTPHeaderField: "authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async{
                if let error = error {
                    completed(.failure(error))
                } else if let data = data, let response = response as? HTTPURLResponse {
                    print("data",data)
                    print("response",response)
                    switch response.statusCode {
                    case 200...399:
                        guard let parsedModel = data.decode(expectedModel) else {
                            completed(.failure(NetworkError.decodingError))
                            return
                        }
                        print(parsedModel)
                        completed(.success(parsedModel))
                    case 401:
                        completed(.failure(NetworkError.userNotExist))
                    default:
                        completed(.failure(NetworkError.somethingWentWrong))
                    }
                }
            }
        }
        task.resume()
    }
}
