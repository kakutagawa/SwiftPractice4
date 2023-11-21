//
//  ContentView.swift
//  MyCamera4
//
//  Created by 芥川浩平 on 2023/11/19.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var captureImage: UIImage? = nil
    @State private var isShowSheet = false
    @State private var photoPickerSelectedImage: PhotosPickerItem? = nil

    var body: some View {
        VStack {

            Spacer()
            Button {
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    print("カメラは利用できます")
                    captureImage = nil
                    isShowSheet.toggle()
                } else {
                    print("カメラは利用できません")
                }
            } label: {
                 Text("カメラを起動する")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(.blue)
                    .foregroundColor(.white)
            }
            .padding()
            .sheet(isPresented: $isShowSheet) {
                if let captureImage {
                    EffectView(isShowSheet: $isShowSheet, captureImage: captureImage)
                } else {
                    ImagePickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
                }
            }

            PhotosPicker(selection: $photoPickerSelectedImage, matching: .images,
                         preferredItemEncoding: .automatic, photoLibrary: .shared()) {
                Text("フォトライブラリーから選択する")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(.blue)
                    .foregroundColor(.white)
            }
            .onChange(of: photoPickerSelectedImage) { _, photosPickerItem in
                if let photosPickerItem {
                    photosPickerItem.loadTransferable(type: Data.self) { result in
                        switch result {
                        case .success(let data):
                            if let data {
                                captureImage = nil
                                captureImage = UIImage(data: data)
                            }
                        case .failure:
                            return
                        }

                    }
                }
            }
        }
        .onChange(of: captureImage) { _, image in
            if let _ = image {
                isShowSheet.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
