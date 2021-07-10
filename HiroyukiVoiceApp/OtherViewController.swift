//
//  OtherViewController.swift
//  HiroyukiVoiceApp
//
//  Created by SHINGO YANAGIDA on 2021/05/11.
//

import Foundation
import UIKit

@available(iOS 10.0, *)
class OtherViewController: UIViewController{
    @IBOutlet weak var ReviewButton: UIButton!
    @IBOutlet weak var TwitterShareButton: UIButton!
    @IBOutlet weak var PrivacyPolicyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 218/255, green: 218/255, blue: 218/255, alpha: 1.0) //背景色
        
        let ButtonColor = UIColor(red:253/255, green: 95/255, blue: 0/255, alpha: 1.0) //ボタンの色
        
        ReviewButton.titleLabel?.numberOfLines = 0
        ReviewButton.setTitleColor(UIColor.white, for: .normal)
        ReviewButton.layer.borderWidth = 1
        ReviewButton.layer.borderColor = UIColor.black.cgColor
        ReviewButton.layer.cornerRadius = 5.0
        ReviewButton.backgroundColor = ButtonColor
        
        TwitterShareButton.titleLabel?.numberOfLines = 0 //ctrl+q+enter
        TwitterShareButton.setTitle("トゥイッターでシェア", for: .normal)
        TwitterShareButton.setTitleColor(UIColor.white, for: .normal)
        TwitterShareButton.layer.borderWidth = 1
        TwitterShareButton.layer.borderColor = UIColor.black.cgColor
        TwitterShareButton.layer.cornerRadius = 5.0
        TwitterShareButton.backgroundColor = ButtonColor
        
        PrivacyPolicyButton.titleLabel?.numberOfLines = 0 //ctrl+q+enter
        PrivacyPolicyButton.setTitle("プライバシーポリシー", for: .normal)
        PrivacyPolicyButton.setTitleColor(UIColor.white, for: .normal)
        PrivacyPolicyButton.layer.borderWidth = 1
        PrivacyPolicyButton.layer.borderColor = UIColor.black.cgColor
        PrivacyPolicyButton.layer.cornerRadius = 5.0
        PrivacyPolicyButton.backgroundColor = ButtonColor
    }
    
    @IBAction func ReviewButton(_ sender: Any) {
        if let AppStoreReviewUrl = URL(string: "https://yasinoki39.github.io/FruitsQuiz_PrivacyPolicy/"){
            UIApplication.shared.open(AppStoreReviewUrl)
        } else {
            // Fallback on earlier versions
        }  //ボタンが押されたらプライバシーポリシーURLへ飛ぶ
    }
    
    @IBAction func TwitterShareButton(_ sender: Any) {
        //シェアするテキストを作成
        let text = "なんだろう。。。"
        let hashTag = "#ひろゆきボタン"
        let completedText = text + "\n" + hashTag
        
        //作成したテキストをエンコード
        let encodedText = completedText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        //エンコードしたテキストをURLに繋げ、URLを開いてツイート画面を表示させる
        if let encodedText = encodedText,
           let url = URL(string: "https://twitter.com/intent/tweet?text=\(encodedText)") {
            UIApplication.shared.open(url)
        }
        
    }
    
    @IBAction func PrivacyPolicyButton(_ sender: Any) {
        if let PrivacyPolicyUrl = URL(string: "https://yasinoki39.github.io/HiroyukiVoiceApp_PrivacyPolicy/"){
            UIApplication.shared.open(PrivacyPolicyUrl)
        } else {
            // Fallback on earlier versions
        }  //ボタンが押されたらプライバシーポリシーURLへ飛ぶ
    }
}
