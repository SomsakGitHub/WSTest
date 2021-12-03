//
//  WSViewController.swift
//  WSTest
//
//  Created by ITD02 on 30/11/2021.
//

import UIKit
import Starscream

class WSViewController: UIViewController {
    
    var webSocketManager = WebSocketManager.shared
    private var dispose: Disposable?

    override func viewDidLoad() {
        super.viewDidLoad()

        connectWebsocket()
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func connectWebsocket(){
//        webSocketManager.onReceiveConnect
//            .subscribe(onNext: { model in
//                print("onReceiveConnect =>", model)
//                self.subcribeMarketSummaryData()
//            }, onError: { error in
//                
//            })
//            .disposed(by: dispose)
    }
}
