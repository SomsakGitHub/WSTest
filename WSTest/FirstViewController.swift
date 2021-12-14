//
//  FirstViewController.swift
//  WSTest
//
//  Created by ITD02 on 30/11/2021.
//

import UIKit
import Starscream
import RxSwift

class FirstViewController: UIViewController {
    
    var webSocketManager = WebSocketManager.shared
    private var disposeBag: DisposeBag? = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
//        print("viewDidLoad")
        
        disposeBag = DisposeBag()
        connectWebsocket()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        print("viewWillAppear")
        if disposeBag == nil {
            disposeBag = DisposeBag()
            webSocketManagerSocketWrit()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //            print("viewWillDisappear")
        disposeBag = nil
        // Called before the content view is removed from the app's view hierarchy.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true)
        webSocketManager.socketDisconnect()
    }
    
    func connectWebsocket(){
        webSocketManager.socketConnect()
        
        webSocketManager.onReceiveConnect
            .subscribe(onNext: { model in
                print("onReceiveConnect =>", model)
                self.webSocketManagerSocketWrit()
            }, onError: { error in
                
            })
            .disposed(by: disposeBag!)
    }
    
    func webSocketManagerSocketWrit(){
        webSocketManager.socketWrite(data: "riccode:.IXIC")
        
        webSocketManager.onReceivePrice
            .subscribe(onNext: { model in
                print("onReceivePrice =>", model)
            }, onError: { error in
                
            })
            .disposed(by: disposeBag!)
    }
}
