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

class SettingsVC: UIViewController, MFMailComposeViewControllerDelegate, UIScrollViewDelegate {
    
    let scrollview = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        createScrollView()
        createSettingsButtons()
        createLabels()
    }
    
    func createScrollView(){
        scrollview.frame = CGRect(x: 0, y: screenHeight * 0.12, width: screenWidth, height: screenHeight)
        scrollview.contentSize = CGSize(width: screenWidth, height: screenHeight * 0.8)
        scrollview.alwaysBounceVertical = true
        scrollview.delegate = self
        scrollview.backgroundColor = .clear
        view.addSubview(scrollview)
    }
    
    func createSettingsButtons(){
        view.backgroundColor = .white
        
        let backButton = UIButton()
        backButton.makeBackButton(view: view, selector: #selector(backClicked),VC: self )
        let shareButton = UIButton()
        shareButton.setSettingsButton(yPozition: 0.08, iconName: "share", title: "Uygulamayı Paylaş", selector: #selector(shareClicked), addView: scrollview, VC: self )
        let rateButton = UIButton()
        rateButton.setSettingsButton(yPozition: 0.18, iconName: "star" , title: "Uygulamayı Puanla", selector: #selector(rateClicked), addView: scrollview, VC: self )
        let contactButton = UIButton()
        contactButton.setSettingsButton(yPozition: 0.28, iconName: "mail" , title: "İletişime Geç", selector: #selector(privacyClicked), addView: scrollview, VC: self )
        let privacyButton = UIButton()
        privacyButton.setSettingsButton(yPozition: 0.43, iconName: "privacy" , title: "Gizlilik Sözleşmesi", selector: #selector(privacyClicked), addView: scrollview, VC: self )
        let termsButton = UIButton()
        termsButton.setSettingsButton(yPozition: 0.53, iconName: "term", title: "Kullanım Şartları", selector: #selector(termsClicked), addView: scrollview, VC: self )
    }
    
    func createLabels(){
        
        let mainTitle = UILabel()
        mainTitle.makeClassicLabel(x: 0.2, y: 0.057, w: 0.6, h: 0.05, text: "Ayarlar", textColor: lacivert, textSize: 22, textAlignment: .center, addView: view)
        let settingSubText = UILabel()
        settingSubText.makeClassicLabel(x: 0.06, y: 0.03, w: 0.9, h: 0.05, text: "Date Atelier & Patiserrie & Eatery", textColor: lacivert, textSize: 16, textAlignment: .left, addView: scrollview)
        let privacyText = UILabel()
        privacyText.makeClassicLabel(x: 0.06, y: 0.38, w: 0.8, h: 0.05, text: "Gizlilik ve Şartlar", textColor: lacivert, textSize: 16, textAlignment: .left, addView: scrollview)
        let thanks = UILabel()
        thanks.makeClassicLabel(x: 0.05, y: 1.1, w: 0.9, h: 0.1, text: "Developed by Berkan Çalışkan", textColor: lacivert, textSize: 16, textAlignment: .center, addView: scrollview)
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
        sendEmail()
    }
    func sendEmail() {
        vibrate(style: .heavy)
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["berkancaliskanios@gmail.com"])
            mail.setMessageBody("<p>Merhaba uygulama içerisinde size bildirmek istediğim bir konu var.</p>", isHTML: true)
            present(mail, animated: true)
        } else {
            vibrate(style: .heavy)
            showCustomAlert(title: "Hata", message: "İletişim Kısmında bir hata oluştu", viewController: self)
        }
    }
    @objc func termsClicked() {
        vibrate(style: .heavy)
        if let url = URL(string: "https://sites.google.com/view/probrowserprivatesecure/terms-of-use") {
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:])
            }}}
    @objc func privacyClicked() {
        vibrate(style: .heavy)
        if let url = URL(string: "https://sites.google.com/view/probrowserprivatesecure/privacy-policy"){
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:])
            }}}
}
