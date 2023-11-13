//
//  ContentView.swift
//  MyMusic4
//
//  Created by 芥川浩平 on 2023/11/13.
//

import SwiftUI

struct ContentView: View {
    private let soundPlayer = SoundPlayer()
    var body: some View {
        ZStack {
            BackgroundView(imageName: "background")
            HStack {
                Button {
                    soundPlayer.cymbalPlay()
                } label: {
                    Image("cymbal")
                }

                Button {
                    soundPlayer.guitarPlay()
                } label: {
                    Image("guitar")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
