//
//  connection_testApp.swift
//  connection-test Watch App
//
//  Created by Charlie Chan on 7/21/23.
//

import SwiftUI

@main
struct connection_test_Watch_AppApp: App {
    
    let manager = WatchConnectionMagaer()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: manager)
        }
    }
}
