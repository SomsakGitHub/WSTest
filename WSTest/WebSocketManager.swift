//
//  WebSocketManager.swift
//  WSTest
//
//  Created by ITD02 on 02/12/2021.
//

import Starscream
import RxSwift

class WebSocketManager {
    
    static let shared = WebSocketManager()
    
    var socket = WebSocket(url: URL(string: "wss://message-global01.utrade.co.th/")!)
    
    public private(set) var onReceiveConnect = PublishSubject<Bool>()
    public private(set) var onReceivePrice = PublishSubject<String>()
    
    func socketConnect(){
        self.socket.delegate = self
        self.socket.connect()
    }
    
    func socketDisconnect(){
        socket.disconnect(forceTimeout: 0)
    }
    
    func socketWrite(data: String) {
        self.socket.write(string: data) {
            print("Send Key \(data) Success")
        }
    }
}

extension WebSocketManager: WebSocketDelegate {
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocketDidConnect: \(socket)")
        self.onReceiveConnect.onNext(true)
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocketDidDisconnect: \(socket) with code: \(socket)")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("websocketDidReceiveMessage: \(text)")
        
        self.onReceivePrice.onNext(text)
        // 1
        //        guard let data = text.data(using: .utf16),
        //          let jsonData = try? JSONSerialization.jsonObject(with: data),
        //          let jsonDict = jsonData as? [String: Any],
        //          let messageType = jsonDict["type"] as? String else {
        //            return
        //        }
        
        // 2
        //        if messageType == "message",
        //           let messageData = jsonDict["data"] as? [String: Any],
        //           let messageAuthor = messageData["author"] as? String,
        //           let messageText = messageData["text"] as? String {
        //
        //            messageReceived(messageText, senderName: messageAuthor)
        //        }
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("websocketDidReceiveData: \(data)")
    }
}
