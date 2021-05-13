//
//  OtherViewController.swift
//  HiroyukiVoiceApp
//
//  Created by SHINGO YANAGIDA on 2021/05/11.
//

import Foundation
import UIKit
import AVFoundation

class OtherViewController: UIViewController{
    @IBOutlet weak var ReviewButton: UIButton!
    @IBOutlet weak var PrivacyPolicyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 218/255, green: 218/255, blue: 218/255, alpha: 1.0) //背景色
            
        let ButtonColor = UIColor(red:253/255, green: 95/255, blue: 0/255, alpha: 1.0)
        
        ReviewButton.titleLabel?.numberOfLines = 0
        ReviewButton.setTitleColor(UIColor.white, for: .normal)
        ReviewButton.layer.borderWidth = 1
        ReviewButton.layer.borderColor = UIColor.black.cgColor
        ReviewButton.layer.cornerRadius = 5.0
        ReviewButton.backgroundColor = ButtonColor
        
        PrivacyPolicyButton.titleLabel?.numberOfLines = 0
        PrivacyPolicyButton.setTitle("プライバシーポリシー", for: .normal) //ctrl+q+enter
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
    
    
    
    @IBAction func PrivacyPolicyButton(_ sender: Any) {
        if let PrivacyPolicyUrl = URL(string: "https://yasinoki39.github.io/FruitsQuiz_PrivacyPolicy/"){
                UIApplication.shared.open(PrivacyPolicyUrl)
            } else {
                // Fallback on earlier versions
            }  //ボタンが押されたらプライバシーポリシーURLへ飛ぶ
        }
}
