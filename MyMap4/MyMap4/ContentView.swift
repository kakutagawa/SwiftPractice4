//
//  ContentView.swift
//  MyMap4
//
//  Created by 芥川浩平 on 2023/11/13.
//

import SwiftUI

struct ContentView: View {

    @State private var inputText = ""
    @State private var displaySearchKey = ""
    @State private var displayMapType: MapType = .standard

    var body: some View {
        VStack {
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
                .onSubmit {
                    displaySearchKey = inputText
                }
                .padding()
            ZStack(alignment: .bottomTrailing) {
                MapView(searchKey: displaySearchKey, mapType: displayMapType)

                Button {
                    switch displayMapType {
                    case .standard:
                        displayMapType = .satellite
                    case .satellite:
                        displayMapType = .hybrid
                    case .hybrid:
                        displayMapType = .standard
                    }
                } label: {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                }
                .padding(.trailing, 20.0)
                .padding(.bottom, 30.0)
            }
        }
    }
}

#Preview {
    ContentView()
}
