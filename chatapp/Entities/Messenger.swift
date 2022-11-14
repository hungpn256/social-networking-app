//
//  Messenger.swift
//  chatapp
//
//  Created by HungPN on 14/11/2022.
//

import Foundation

enum TypeMessage:String,Codable {
    case MESSAGE = "MESSAGE"
    case NOTIFICATION = "NOTIFICATION"
}

enum TypeConversation:String,Codable{
    case PRIVATE, GROUP
}

struct UserSummary: Codable{
    let _id: String
    let avatar: String?
    let fullName: String
}

struct Message: Codable{
    let _id: String
    let createdAt: String
    let content: String
    let deletedAt: String?
    let type: TypeMessage
    let reply: MessageReply?
    let updatedAt: String?
    let conversation: String
    let createdBy: UserSummary
}

struct MessageReply: Codable{
    let _id: String
    let createdAt: String
    let content: String
    let deletedAt: String?
    let type: TypeMessage
    let updatedAt: String
    let conversation: String
    let createdBy: UserSummary
}

struct Conversation:Codable{
    let _id: String
    let createdAt: String
    let type: TypeConversation
    let host: String
    let updatedAt: String
    let name: String?
    let pinMessage: Message?
    let participants: [Participant]
    let messages: [Message]
    let numberOfMessages: Int
}

struct Participant:Codable {
    let user: UserSummary
    let nickName: String?
    let lastSeen: String?
    let lastDelete: String?
}
