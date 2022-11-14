//
//  MessengerViewModel.swift
//  chatapp
//
//  Created by HungPN on 14/11/2022.
//

import Foundation

struct ConversationResponse: Codable{
    let conversations:[Conversation]
}

final class MessengerViewModel{
    static let shared = MessengerViewModel()
    var conversations: Observable<[Conversation]> = Observable([])
    
    
    func getConversation(updatedAt: String?){
        print(123)
        ApiRequest().call("\(AppContant.baseUrl)/conversation", .GET, ["lastConversationUpdatedAt":updatedAt ?? ""], ConversationResponse.self) {[weak self] result in
            switch(result){
            case .failure(let error):
                print(error)
            case .success(let data):
                self?.conversations.value = data.conversations
            }
        }
    }
}
