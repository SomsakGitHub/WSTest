//
//  WSViewController.swift
//  WSTest
//
//  Created by ITD02 on 30/11/2021.
//

import UIKit
import Starscream

class WSViewController: UIViewController {
    
//    var socket: WebSocket!
//    let wsUrl = "wss://8121-115-31-191-21.ngrok.io"
    var socket = WebSocket(url: URL(string: "wss://8121-115-31-191-21.ngrok.io")!)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectWS()
    }
    
    deinit {
      socket.disconnect(forceTimeout: 0)
      socket.delegate = nil
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func connectWS(){
//        var request = URLRequest(url: URL(string: self.wsUrl)!)
//        request.timeoutInterval = 5
//        self.socket = WebSocket(request: request)
        self.socket.delegate = self
        self.socket.connect()
    }
}

extension WSViewController: WebSocketDelegate {
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocketDidConnect: \(socket)")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocketDidDisconnect: \(socket) with code: \(socket)")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("websocketDidReceiveMessage: \(text)")
        
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
    
//    func didReceive(event: WebSocketEvent, client: WebSocket) {
//        switch event {
//        case .connected(let headers):
//            isConnected = true
//            checkConnectWS()
//            print("websocket is connected: \(headers)")
//        case .disconnected(let reason, let code):
//            isConnected = false
//            checkConnectWS()
//            print("websocket is disconnected: \(reason) with code: \(code)")
//        case .text(let string):
//            print("Received text: \(string)")
//            self.appendMessage(message: string)
//        case .binary(let data):
//            print("Received data: \(data.count)")
//        case .ping(_):
//            break
//        case .pong(_):
//            break
//        case .viabilityChanged(_):
//            break
//        case .reconnectSuggested(_):
//            break
//        case .cancelled:
//            isConnected = false
//        case .error(_):
//            isConnected = false
//            handleError(error)
//        }
//    }
}
