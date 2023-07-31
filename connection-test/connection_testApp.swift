//
//  connection_testApp.swift
//  connection-test
//
//  Created by Charlie Chan on 7/21/23.
//

import SwiftUI

@main
struct connection_testApp: App {
    
    let controller = ViewController()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: controller)
        }
    }
}
