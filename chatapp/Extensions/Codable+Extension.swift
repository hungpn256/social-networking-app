//
//  Codable+Extension.swift
//  chatapp
//
//  Created by HungPN on 10/11/2022.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        let serialized = (try? JSONSerialization.jsonObject(with: self.encode(), options: .allowFragments)) ?? nil
        return serialized as? [String: Any] ?? [String: Any]()
    }
    
    func encode() -> Data {
        return (try? JSONEncoder().encode(self)) ?? Data()
    }
}

extension Data {
    func decode<T: Codable>(_ object: T.Type) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: self)
        } catch {
            print(error)
            return nil
        }
    }
}
