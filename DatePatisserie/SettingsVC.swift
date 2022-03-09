//
//  SettingsVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 13.01.2022.
//

import UIKit
import Hero
import StoreKit
import MessageUI

class SettingsVC: UIViewController, MFMailComposeViewControllerDelegate {
    
        override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        
    }

    func createUI(){
        
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        let stringMultiplier = 0.00115 * screenHeight
      
//      view.backgroundColor = UIColor(red: 0.92, green: 0.93, blue: 0.94, alpha: 1.00)
        view.backgroundColor = .white
        

        let mainTitle = UILabel()
        mainTitle.text = NSLocalizedString("Ayarlar", comment: "")
        mainTitle.textAlignment = .center
        mainTitle.textColor = koyuYesil
        mainTitle.numberOfLines = 0
        mainTitle.font = UIFont(name: "Gilroy-Bold", size: 22 * stringMultiplier)
        mainTitle.frame = CGRect(x: 0.2 * screenWidth, y: 0.057 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(mainTitle)
        
        
        let backButton = UIButton()
        backButton.setBackgroundImage(UIImage(named: "back_btn"), for: UIControl.State.normal)
        backButton.frame = CGRect(x: 0.04 * screenWidth, y: 0.07 * screenHeight, width: 0.06 * screenWidth, height: 0.024 * screenHeight)
        backButton.contentVerticalAlignment.self = .center
        backButton.contentHorizontalAlignment.self = .center
                view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backClicked), for: UIControl.Event.touchUpInside)
        
        
        let settingSubText = UILabel()
        settingSubText.text = NSLocalizedString("Date Atelier & Patiserrie & Eatery ", comment: "")
        settingSubText.textAlignment = .left
        settingSubText.textColor = .black
        settingSubText.numberOfLines = 0
        settingSubText.font = UIFont(name: "Gilroy-Bold", size: 16 * stringMultiplier)
        settingSubText.frame = CGRect(x: 0.06 * screenWidth, y: 0.134 * screenHeight, width: 0.9 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(settingSubText)
        
        
        let shareButton = UIButton()
        shareButton.setBackgroundImage(UIImage(named: "btn_set_select"), for: UIControl.State.normal)
        shareButton.frame = CGRect(x: 0.04 * screenWidth, y: 0.18 * screenHeight, width: 0.92 * screenWidth, height: 0.086 * screenHeight)
//        shareButton.backgroundColor = UIColor(red: 1.00, green: 0.67, blue: 0.55, alpha: 0.50)
        shareButton.contentVerticalAlignment.self = .center
        shareButton.contentHorizontalAlignment.self = .left
        shareButton.setTitle(NSLocalizedString("      🚀   Uygulamayı Paylaş", comment: ""), for: UIControl.State.normal)
        shareButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        shareButton.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 16)

                view.addSubview(shareButton)
        shareButton.addTarget(self, action: #selector(shareClicked), for: UIControl.Event.touchUpInside)
        
        
        let rateButton = UIButton()
        rateButton.setBackgroundImage(UIImage(named: "btn_set_select"), for: UIControl.State.normal)
        rateButton.frame = CGRect(x: 0.04 * screenWidth, y: 0.26 * screenHeight, width: 0.92 * screenWidth, height: 0.086 * screenHeight)
        rateButton.contentVerticalAlignment.self = .center
        rateButton.contentHorizontalAlignment.self = .left
//        rateButton.backgroundColor = UIColor(red: 1.00, green: 0.67, blue: 0.55, alpha: 0.50)
        rateButton.setTitle(NSLocalizedString("      ⭐️   Uygulamayı Puanla", comment: ""), for: UIControl.State.normal)
        rateButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        rateButton.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 16)

                view.addSubview(rateButton)
        rateButton.addTarget(self, action: #selector(rateClicked), for: UIControl.Event.touchUpInside)
        
        
        let contactButton = UIButton()
        contactButton.setBackgroundImage(UIImage(named: "btn_set_select"), for: UIControl.State.normal)
        contactButton.frame = CGRect(x: 0.04 * screenWidth, y: 0.34 * screenHeight, width: 0.92 * screenWidth, height: 0.086 * screenHeight)
        contactButton.contentVerticalAlignment.self = .center
        contactButton.contentHorizontalAlignment.self = .left
        contactButton.setTitle(NSLocalizedString("      💌   İletişime Geç", comment: ""), for: UIControl.State.normal)
        contactButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        contactButton.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 16)
                view.addSubview(contactButton)
        contactButton.addTarget(self, action: #selector(contactClicked), for: UIControl.Event.touchUpInside)
        
        let privacyText = UILabel()
        privacyText.text = NSLocalizedString("Gizlilik ve Şartlar", comment: "")
        privacyText.textAlignment = .left
        privacyText.textColor = .black
        privacyText.numberOfLines = 0
        privacyText.font = UIFont(name: "Gilroy-Bold", size: 16 * stringMultiplier)
        privacyText.frame = CGRect(x: 0.06 * screenWidth, y: 0.425 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(privacyText)
        
    
        let privacyButton = UIButton()
        privacyButton.setBackgroundImage(UIImage(named: "btn_set_select"), for: UIControl.State.normal)
        privacyButton.frame = CGRect(x: 0.04 * screenWidth, y: 0.47 * screenHeight, width: 0.92 * screenWidth, height: 0.086 * screenHeight)
        privacyButton.setTitle(NSLocalizedString("      📝   Gizlilik Sözleşmesi", comment: ""), for: UIControl.State.normal)
        privacyButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        privacyButton.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 16)
        privacyButton.contentVerticalAlignment.self = .center
        privacyButton.contentHorizontalAlignment.self = .left
        view.addSubview(privacyButton)
        privacyButton.addTarget(self, action: #selector(privacyClicked), for: UIControl.Event.touchUpInside)
        
        
        let termsButton = UIButton()
        termsButton.setBackgroundImage(UIImage(named: "btn_set_select"), for: UIControl.State.normal)
        termsButton.frame = CGRect(x: 0.04 * screenWidth, y: 0.55 * screenHeight, width: 0.92 * screenWidth, height: 0.086 * screenHeight)
        termsButton.setTitle(NSLocalizedString("      📑   Kullanım Şartları", comment: ""), for: UIControl.State.normal)
        termsButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        termsButton.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 16)
        termsButton.contentVerticalAlignment.self = .center
        termsButton.contentHorizontalAlignment.self = .left
        view.addSubview(termsButton)
        termsButton.addTarget(self, action: #selector(termsClicked), for: UIControl.Event.touchUpInside)
        

        
    }
    
    @objc func backClicked() {
        vibrate(style: .heavy)
        dismiss(animated: true, completion: nil)
    }
    @objc func shareClicked() {
        vibrate(style: .heavy)
        let generator = UIImpactFeedbackGenerator(style: .medium)
                     generator.impactOccurred()
                     
                     // Data to share
                     let sharedText = NSLocalizedString("Bu uygulamayı çok beğendim.", comment: "")
                     let sharedImage = UIImage(named: "AppIcon")
                     
                       // set up activity view controller
                     let items: [Any] = [sharedImage,sharedText]
                       let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
                       activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
                       self.present(activityViewController, animated: true, completion: nil)
    }
    @objc func rateClicked() {
        vibrate(style: .heavy)
        SKStoreReviewController.requestReview()
    }
    

    @objc func contactClicked(){
        vibrate(style: .heavy)
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        sendEmail()
    }
    
    func sendEmail() {
        vibrate(style: .heavy)
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["berkancaliskanios@gmail.com"])
            mail.setMessageBody("<p>Merhaba uygulamada yardumcı olmanızı istediğim bir konu var.</p>", isHTML: true)

            present(mail, animated: true)
        } else {
            vibrate(style: .heavy)
            // show failure alert
            
     
        }
    }
    
    
    @objc func termsClicked() {
        vibrate(style: .heavy)
        if let url = URL(string: "https://sites.google.com/view/probrowserprivatesecure/terms-of-use") {
             if UIApplication.shared.canOpenURL(url){
              UIApplication.shared.open(url, options: [:])
             }
        }
  
    }
 
    @objc func privacyClicked() {
        vibrate(style: .heavy)
        
        if let url = URL(string: "https://sites.google.com/view/probrowserprivatesecure/privacy-policy"){
             if UIApplication.shared.canOpenURL(url){
              UIApplication.shared.open(url, options: [:])
             }
        }
    }



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

    if segue.identifier == "mainToSet"{

        let destination = segue.destination as! SettingsVC
        destination.hero.isEnabled = true
        destination.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .right), dismissing: .slide(direction: .left))
        
      }
   }
}

