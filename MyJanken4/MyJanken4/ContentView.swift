//
//  ContentView.swift
//  MyJanken4
//
//  Created by 芥川浩平 on 2023/11/10.
//

import SwiftUI

enum Janken: String, CaseIterable {
    case gu
    case choki
    case pa

    var text: String {
        switch self {
        case .gu:
            "グー"
        case .choki:
            "チョキ"
        case .pa:
            "パー"
        }
    }
}

struct ContentView: View {

    @State private var answer: Janken?

    var body: some View {
        VStack {
            Spacer()

            if let answer {
                Image(answer.rawValue)
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text(answer.text)
            }

            if answer == nil {
                Text("これからじゃんけんをします！")
            }

            Button {
                var newAnswer: Janken?
                repeat {
                    newAnswer = Janken.allCases.randomElement()
                } while answer == newAnswer
                        answer = newAnswer
            } label: {
                Text("じゃんけんをする！")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(.pink)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ContentView()
}
