//
//  AudioPlay.swift
//  HiroyukiVoiceApp
//
//  Created by SHINGO YANAGIDA on 2022/05/05.
//

import Foundation
import AVFoundation

class AudioPlay{
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    private var audioName: String = ""
    
    func audioPlay(audioName: String) {
        self.audioName = audioName
        playSound(name: self.audioName)
    }
    
    private func playSound(name: String) {//音楽再生するメソッド
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("音源ファイルが見つかりません")
            return
        }

        do {
            // AVAudioPlayerのインスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))

            // 音声の再生
            if  audioPlayer.isPlaying { //クラッシュを防ぐため
                audioPlayer.stop()
                audioPlayer.currentTime = 0
            }
            
            audioPlayer.play() //音声再生
        
        } catch {
            print("音声再生エラー")
        }
    }
}

