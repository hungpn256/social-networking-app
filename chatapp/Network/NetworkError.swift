//
//  NetworkError.swift
//  chatapp
//
//  Created by HungPN on 14/11/2022.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case somethingWentWrong
    case tokenExpired
    case userNotExist
}

extension NetworkError {
    var localizedDescription: String {
        switch self {
        case .decodingError:
            return "Decoding error, please check your data model"
            
        case .somethingWentWrong:
            return "Something went wrong, please try again later"

        case .tokenExpired:
            return "Token is Expired"

        case .userNotExist:
            return "User is not Exist"
        }
    }
}

extension Error {
    func shouldIgnore() -> Bool {
        switch self.localizedDescription {
        case "cancelled":
            return true
        default:
            return false
        }
    }
}
