//
//  WatchConnectionManager.swift
//  connection-test Watch App
//
//  Created by Charlie Chan on 7/22/23.
//

import Foundation
import WatchConnectivity

class WatchConnectionMagaer: NSObject, WCSessionDelegate, ObservableObject {
    
    @Published private var model = WatchConnectionModel()
    
    var needRespond: Bool {
        return model.needRespond
    }
    
    var receivedData: String? {
        return model.receivedData
    }
    
    var itemList: [String]? {
        if let data = model.receivedData, model.needRespond {
            return WatchConnectionModel.itemsList[data]
        } else {
            return nil
        }
    }
    
    var session: WCSession = .default
    
    func choosed(index: Int) {
        send(type: model.receivedData!, item: WatchConnectionModel.itemsList[model.receivedData!]![index])
        model.needRespond = false
        model.receivedData = nil
    }
    
    override init() {
        super.init()
        session.delegate = self
        session.activate()
    }
    
    // MARK: - WCSession
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let cmd = message["cmd"] as? String,  cmd == "new" {
            model.receivedData = message["message"] as? String
            model.needRespond = true
        } else if let cmd = message["cmd"] as? String, cmd == "cancel" {
            model.receivedData = nil
            model.needRespond = false

        }
    }
    
    func send(type: String, item: String) {
        session.sendMessage(["type": type, "item": item], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
    
}
