//
//  User.swift
//  chatapp
//
//  Created by HungPN on 14/11/2022.
//

import Foundation

struct User:Codable{
    let email: String
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let gender: String
    let avatar: String?
    let cover: String?
    let _id: String
//    let status: String
}
