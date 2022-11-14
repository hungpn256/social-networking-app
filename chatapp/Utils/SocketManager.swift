//
//  SocketManager.swift
//  chatapp
//
//  Created by HungPN on 14/11/2022.
//

import Foundation
import SocketIO

class APISocket:NSObject {
    private let manager = SocketManager(socketURL: URL(string: AppContant.baseUrlSocket)!, config: [.log(false), .compress])
    static let shared = APISocket()
    var socket: SocketIOClient
    private override init(){
        self.socket = manager.defaultSocket
    }
    
    func establishConnection(){
        if(self.socket.status != .connected){
            
            socket.on(clientEvent: .connect) { res, er in
                print(er, "123=====================")
            }
            guard let token = UserDefaults.standard.string(forKey: AppContant.token) else{
                return
            }
            self.socket.connect(withPayload: ["token": token])
        }
    }
    
    func disconnectSocket(){
        if(self.socket.status == .connected){
            self.socket.disconnect()
        }
    }
}
