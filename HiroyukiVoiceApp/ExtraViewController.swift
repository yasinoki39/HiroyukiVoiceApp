//
//  ExtraViewController.swift
//  HiroyukiVoiceApp
//
//  Created by SHINGO YANAGIDA on 2021/03/24.
//

import Foundation
import UIKit
import AVFoundation

class ExtraViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let voice =  [
        ["好きじゃねーよ!","野菜は美味しいから食べるの!","ベーシックインカマー","インターネットが写像であることに"],
        ["おやすみなさい","ダメだこれ","しゃぞー","既存のコピー"],
        ["コッコピ","Chinise Go!(中国人消えろ)"],
        //["1","2","3","4"],
        // ["1","2","3","4"],
    ]//！、？は半角
    
    var audioPlayer: AVAudioPlayer! //ViewController に AVAudioPlayerのインスタンス を 宣言
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return voice.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return voice[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width, height: 18)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 5 * 10) / 4
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ButtonCollectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ViewCell
        cell.numberLabel.text = voice[indexPath.section][indexPath.row]
        
        cell.numberLabel.textColor = .white
            
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { //押された場合、その音声を再生
        let voiceName = voice[indexPath.section][indexPath.row]
        
        print("\(voiceName).mp3")
        
        playSound(name: voiceName)
    }
    
    @IBOutlet weak var ButtonCollectionView: UICollectionView!
    @IBOutlet weak var ButtonHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ButtonCollectionView.delegate = self
        ButtonCollectionView.dataSource = self
        ButtonCollectionView.register(ViewCell.self, forCellWithReuseIdentifier: "cellId")
        ButtonHeightConstraint.constant = view.frame.width * 1.4
        ButtonCollectionView.backgroundColor = .clear
        ButtonCollectionView.contentInset = .init(top: 0, left: 2, bottom: 0, right: 2)
        
        view.backgroundColor = UIColor(red: 218/255, green: 218/255, blue: 218/255, alpha: 1.0)  //背景色
    }
    
    class ViewCell: UICollectionViewCell {
        
        let numberLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0;
            label.textColor = .white
            label.textAlignment = .center
            label.text = "1"
            label.font = .boldSystemFont(ofSize: 12)
            label.clipsToBounds = true
            label.backgroundColor = UIColor(red:253/255, green: 95/255, blue: 0/255, alpha: 1.0)  //ボタンの色
            label.lineBreakMode = .byTruncatingTail
            return label
        }()
        
        override init(frame: CGRect){
            super.init(frame: frame)
            addSubview(numberLabel)
            
            numberLabel.frame.size = self.frame.size
            numberLabel.layer.cornerRadius = self.frame.height / 8
            numberLabel.layer.borderColor = UIColor.darkGray.cgColor //外枠の色
            numberLabel.layer.borderWidth = 1.5
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}


extension ExtraViewController: AVAudioPlayerDelegate {
    func playSound(name: String) {//音楽再生するメソッド
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("音源ファイルが見つかりません")
            return
        }

        do {
            // AVAudioPlayerのインスタンス化
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))

            // AVAudioPlayerのデリゲートをセット
            audioPlayer.delegate = self

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
