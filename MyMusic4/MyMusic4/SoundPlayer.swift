//
//  SoundPlayer.swift
//  MyMusic4
//
//  Created by 芥川浩平 on 2023/11/13.
//

import UIKit
import AVFoundation

final class SoundPlayer: NSObject {

    private let cymbalData = NSDataAsset(name: "cymbalSound")?.data
    private var cymbalPlayer: AVAudioPlayer?

    private let guitarData = NSDataAsset(name: "guitarSound")?.data
    private var guitarPlayer: AVAudioPlayer?

    func cymbalPlay() {
        do {
            if let cymbalData {
                cymbalPlayer = try AVAudioPlayer(data: cymbalData)
            }
            cymbalPlayer?.play()
        } catch {
            print("シンバルでエラーが発生しました")
        }

    }

    func guitarPlay() {
        do {
            if let guitarData {
                guitarPlayer = try AVAudioPlayer(data: guitarData)
            }
            guitarPlayer?.play()
        } catch {
            print("ギターでエラーが発生しました")
        }

    }

}
