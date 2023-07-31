//
//  ContentView.swift
//  connection-test
//
//  Created by Charlie Chan on 7/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewController
    
    var body: some View {
        NavigationStack {
            VStack {
                HintView()
                Spacer()
                ScrollView {
                    ForEach(0..<viewModel.itemTypes.count) { i in
                        ListItemView(item: "\(i): \(viewModel.itemTypes[i])", index: i)
                            .onTapGesture {
                                viewModel.togglePopOver(at: i)
                            }
                    }
                }
            }
            .navigationTitle("Icon types")
            .popover(isPresented: .constant(viewModel.showPopOver)) {
                PopOverView(viewModel:  viewModel)
            }
        }
    }
}

struct HintView: View {
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "lightbulb.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20)
                .foregroundColor(.yellow)
            Text("Click the type you want to choose on your watch!")
        }
    }
}

struct ListItemView: View {
    let item: String
    let index: Int
    
    var body: some View {
        HStack {
            Spacer()
            Text(item)
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
        }
        .frame(height: 100)
        .if(index%2 == 1) { view in
            view.background(Color.gray.opacity(0.3))
        }
        
    }
}

struct PopOverView: View {
    @ObservedObject var viewModel: ViewController
    
    var body: some View {
        VStack {
            
            HStack {
                Text(viewModel.itemTypes[viewModel.currentIndex])
                    .font(.title)
                Spacer()
            }.padding(30)
            Text("Your favourite item in this type is:")
                .font(.title2)
            Spacer()
            if viewModel.isResponded, let data = viewModel.receivedData {
                Text(data)
                    .font(.system(size: 80))
                Spacer()
            } else {
                HStack {
                    Image(systemName: "rays")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25)
                    Text("Waiting for Watch to resopnd...")
                        .font(.title3)
                }
                Spacer()
            }
            Spacer()
            Text("The device is: \(viewModel.isReachable)")
        }
        .onDisappear(perform: viewModel.cancel)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewController())
    }
}

