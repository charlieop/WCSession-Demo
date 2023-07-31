//
//  ViewController.swift
//  connection-test
//
//  Created by Charlie Chan on 7/22/23.
//

import SwiftUI
import WatchConnectivity

class ViewController: NSObject, ObservableObject, WCSessionDelegate {
    
    @Published private var model: ConnectionModel = ConnectionModel()
    
    var showPopOver: Bool {
        return model.showPopOver
    }
    var currentIndex: Int {
        return model.currentIndex
    }
    var itemTypes: [String] {
        return model.itemTypes
    }
    var isResponded: Bool {
        return model.isResponded
    }
    var receivedData: String? {
        return model.receivedData
    }
    
    var session: WCSession = .default
    
    private(set) var isReachable = "Checking..."
    
    override init() {
        super.init()
        session.delegate = self
        session.activate()
    }
    
    // MARK: - WCSession
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        if let type = message["type"] as? String,  type == model.itemTypes[model.currentIndex] {
            if let item = message["item"] as? String {
                model.isResponded = true
                model.receivedData = item
            }
        }
    }
   
    // MARK: - Intents

    func togglePopOver(at index: Int) {
        model.isResponded = false
        model.receivedData = nil
        model.showPopOver = true
        model.currentIndex = index
        checkConnectivity()
        send(msg: model.itemTypes[index])
    }
    
    func checkConnectivity() {
        if session.isReachable {
            self.isReachable = "Online"
        } else {
            self.isReachable = "Offline"
        }
    }
    
    func send(msg: String) {
        session.sendMessage(["message": msg, "cmd": "new"], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
    
    func cancel() {
        session.sendMessage(["cmd": "cancel"], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
}
