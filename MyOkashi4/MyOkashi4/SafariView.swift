//
//  SafariView.swift
//  MyOkashi4
//
//  Created by 芥川浩平 on 2023/11/27.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        //処置なし
    }
}
