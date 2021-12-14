//
//  SecondViewController.swift
//  WSTest
//
//  Created by ITD02 on 14/12/2021.
//

import UIKit
import RxSwift

class SecondViewController: UIViewController {
    
    var webSocketManager = WebSocketManager.shared
    private var disposeBag: DisposeBag? = DisposeBag()

    override func viewDidLoad() {
            super.viewDidLoad()
//            print("viewDidLoad")
            
            disposeBag = DisposeBag()
        webSocketManagerSocketWrit()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
//            print("viewWillAppear")
            if disposeBag == nil {
                disposeBag = DisposeBag()
                webSocketManagerSocketWrit()
            }
        }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        print("viewWillDisappear")
        disposeBag = nil
        // Called before the content view is removed from the app's view hierarchy.
    }
    
    func webSocketManagerSocketWrit(){
        webSocketManager.socketWrite(data: "riccode:.NDX")
        
        webSocketManager.onReceivePrice
            .subscribe(onNext: { model in
                print("onReceivePrice SecondViewController =>", model)
            }, onError: { error in
                
            })
            .disposed(by: disposeBag!)
    }
}
