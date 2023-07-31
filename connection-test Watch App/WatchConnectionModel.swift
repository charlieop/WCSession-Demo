//
//  WatchConnectionModel.swift
//  connection-test Watch App
//
//  Created by Charlie Chan on 7/22/23.
//

import Foundation


struct WatchConnectionModel {
    static let itemsList = [
        "Numbers": ["1️⃣", "2️⃣", "3️⃣", "4️⃣","5⃣️", "6⃣️", "7⃣️", "8⃣️", "9⃣️"],
        "Animals": ["🐱", "🐶", "🐮", "🐷", "🐦", "🐰", "🐍"],
        "Fruits": ["🍎", "🍋", "🍉", "🍌", "🍓", "🍊", "🥑", "🍍", "🥝"],
        "Meats": ["🥩", "🥓", "🍖", "🍗", "🍤", "🚫"],
        "Vegetables": ["🌽", "🥬", "🥕", "🍅", "🧄", "🥔"],
        "Faces": ["😮", "😊", "🥰", "🥺", "🤪", "😋", "😡", "🥵"],
        "Transports": ["🚅", "✈️", "🚗", "🚁", "🛳️"]
    ]
    
    var needRespond = false
    var receivedData: String?
    
    init() {
    }

}
