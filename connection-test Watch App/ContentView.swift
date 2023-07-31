//
//  ContentView.swift
//  connection-test Watch App
//
//  Created by Charlie Chan on 7/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: WatchConnectionMagaer
    
    var body: some View {
        
        
        if viewModel.needRespond {
            VStack {
                HStack {
                    Text("CLick to Select")
                        .font(.title3)
                    Spacer()
                }.padding()
                Spacer()
                ScrollView() {
                    if let itemList = viewModel.itemList {
                        VStack {
                            ForEach (0..<itemList.count) { i in
                                ScrollItemView(index: i, viewModel: viewModel)}
                        }
                    } else {
                        Text("Error...")
                    }
                }
            }
        } else {
            VStack(spacing: 10) {
                Image(systemName: "globe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.accentColor)
                    .frame(width: 30)
                Text("Waiting for instructions...")
                    .font(.title3)
            }
            .padding()
        }
    }
}

struct ScrollItemView: View {
    
    var index: Int
    var viewModel: WatchConnectionMagaer
    
    var body: some View {
        if let itemList = viewModel.itemList {
            VStack {
                
                Text(itemList[index])
                    .font(.title)
                    .frame(height: 150)
                Spacer()
            }.onTapGesture {
                viewModel.choosed(index: index)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: WatchConnectionMagaer())
    }
}

