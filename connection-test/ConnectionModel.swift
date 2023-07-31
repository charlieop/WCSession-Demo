//
//  ConnectionModel.swift
//  connection-test
//
//  Created by Charlie Chan on 7/22/23.
//

import Foundation


struct ConnectionModel {
    
    var showPopOver = false
    var currentIndex = -1
    var itemTypes = ["Numbers", "Animals", "Fruits", "Meats", "Vegetables", "Faces", "Transports"]
    var receivedData: String?
    var isResponded = false
    
    init() {
    }
    
}
