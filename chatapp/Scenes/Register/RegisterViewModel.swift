//
//  RegisterViewModel.swift
//  chatapp
//
//  Created by HungPN on 14/11/2022.
//

import Foundation

struct expectModelRegister:Codable{
    let user: User
}

final class RegisterViewModel{
    
    func register(body: [String: Any], completion: @escaping (Bool)->Void){
        
        ActivityIndicatorPresenter.show()
        ApiRequest().call("\(AppContant.baseUrl)/auth/register", .POST, body, expectModelRegister.self) { result in
            ActivityIndicatorPresenter.hide()
            switch result{
            case .failure(let error):
                print(error)
                completion(false)
            case .success(let data):
                print(data)
                completion(true)
            }
        
        }
    }
}
