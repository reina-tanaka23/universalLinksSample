//
//  ViewController.swift
//  universalLinksSample
//
//  Created by reina.tanaka on 2021/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startTwitter(_ sender: Any) {
//        let text = "今日の積み上げ"
        let countTime = "00:00:03"
//        let encodedCountTime = countTime.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let text = "\(countTime)何かデフォルトで欄に入っててほしい文字列"
        let encodedText = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        let encodedText = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        

        
        if UIApplication.shared.canOpenURL(URL(string: "twitter://")!) {
            if let encodedText = encodedText,
               let url = URL(string: "https://twitter.com/intent/tweet?text=\(encodedText)") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
//            if let twitterUrl = URL(string: "twitter://") {
//            if let twitterUrl = URL(string: "https://twitter.com/intent/tweet?text= \(encodedText)") {
//                UIApplication.shared.openURL(twitterUrl)
//            }
        } else {
            //外部ブラウザでURLを開く
            let url = NSURL(string: "https://twitter.com/")
            if UIApplication.shared.canOpenURL(url! as URL){
                print("not canOpenURL")
                UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
            }
        }
    }
}
