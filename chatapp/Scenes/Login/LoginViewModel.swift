//
//  LoginViewModel.swift
//  chatapp
//
//  Created by HungPN on 10/11/2022.
//

import Foundation

struct expectModelLogin:Codable{
    let user: User
    let token: String
}

final class LoginViewModel{
    
    func login(_ email:String?, _ password: String?, completion: @escaping (Bool)->Void){
        print(email, password)
        guard let email = email, let password = password else{
            completion(false)
            return
        }
        
        ActivityIndicatorPresenter.show()
        ApiRequest().call("\(AppContant.baseUrl)/auth/login", .POST, ["email": email, "password": password], expectModelLogin.self) { result in
            ActivityIndicatorPresenter.hide()
            switch result{
            case .failure(let error):
                print(error)
                completion(false)
            case .success(let data):
                print(data)
                UserDefaults.standard.set(data.token, forKey: AppContant.token)
                completion(true)
            }
        
        }
    }
}
