//
//  ContentView.swift
//  MyOkashi4
//
//  Created by 芥川浩平 on 2023/11/26.
//

import SwiftUI

struct ContentView: View {
    @State private var okashiDataList = OkashiData()
    @State private var inputText = ""
    @State private var showSafari = false

    var body: some View {
        VStack {
            TextField("キーワード",text: $inputText, prompt: Text("キーワードを入力してください"))
                .onSubmit {
                    okashiDataList.searchOkashi(keyword: inputText)
                }
                .submitLabel(.search)
                .padding()

            List(okashiDataList.okashiList) { okashi in
                Button {
                    okashiDataList.okashiLink = okashi.link
                    showSafari.toggle()
                } label: {
                    HStack {
                        AsyncImage(url: okashi.image) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                        } placeholder: {
                            ProgressView()
                        }
                        Text(okashi.name)
                    }
                }
            }
            .sheet(isPresented: $showSafari, content: {
                if let url = okashiDataList.okashiLink {
                    SafariView(url: url)
                        .ignoresSafeArea(edges: [.bottom])
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
