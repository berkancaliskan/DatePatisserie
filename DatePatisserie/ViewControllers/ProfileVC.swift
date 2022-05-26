//
//  ProfileVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 26.01.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileVC: UIViewController {
    
    var currentUser = Auth.auth().currentUser
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        createUI()
        
    }
    func createUI(){

        view.backgroundColor = UIColor.white
        
        let mainTitle = UILabel()
        mainTitle.text = NSLocalizedString("Profil", comment: "")
        mainTitle.textAlignment = .center
        mainTitle.textColor = lacivert
        mainTitle.numberOfLines = 0
        mainTitle.font = UIFont(name: "Gilroy-Bold", size: 22 * stringMultiplier)
        mainTitle.frame = CGRect(x: 0.2 * screenWidth, y: 0.057 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(mainTitle)
        
        
        let profileImg = UIImageView()
        profileImg.image = UIImage(named: "berkan_profile")
        profileImg.frame = CGRect(x: 0.3 * screenWidth, y: 0.146 * screenHeight, width: 0.4 * screenWidth, height: 0.4 * screenWidth)
        profileImg.layer.cornerRadius =  0.2 * screenWidth
        profileImg.layer.borderWidth = 2
        profileImg.layer.borderColor = yesil.cgColor
        profileImg.layer.masksToBounds = true
        view.addSubview(profileImg)
        
        
        let backButton = UIButton()
        backButton.makeBackButton(view: view, selector: #selector(backClicked), VC: self)
        
        let nameText  = UILabel()
        nameText.textAlignment = .center
        nameText.text = "\(currentUser?.displayName ?? "Berkan Çalışkan")"
        nameText.textColor = .black
        nameText.font = UIFont(name: "Gilroy-Medium", size: 20 * stringMultiplier)
        nameText.layer.cornerRadius = 12
        nameText.frame = CGRect(x: 0.1 * screenWidth, y: 0.37 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(nameText)
        
        let mailTitle  = UILabel()
        mailTitle.textAlignment = .left
        mailTitle.text = "Mail Adresiniz"
        mailTitle.textColor = lacivert
        mailTitle.font = UIFont(name: "Gilroy-Medium", size: 15 * stringMultiplier)
        mailTitle.frame = CGRect(x: 0.1 * screenWidth, y: 0.42 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(mailTitle)
        
        let mailText  = UILabel()
        mailText.textAlignment = .left
        mailText.text = "   \(Auth.auth().currentUser?.email ?? "mail@mail.com")"
        mailText.textColor = lacivert
        mailText.font = UIFont(name: "Gilroy-Medium", size: 16 * stringMultiplier)
        mailText.frame = CGRect(x: 0.1 * screenWidth, y: 0.46 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        mailText.layer.borderWidth = 1
        mailText.layer.cornerRadius = 12
        view.addSubview(mailText)
        
        
        let idTitle  = UILabel()
        idTitle.textAlignment = .left
        idTitle.text = "Kullanıcı ID"
        idTitle.textColor = lacivert
        idTitle.font = UIFont(name: "Gilroy-Medium", size: 15 * stringMultiplier)
        idTitle.layer.cornerRadius = 12
        idTitle.frame = CGRect(x: 0.1 * screenWidth, y: 0.52 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(idTitle)
        
        let idText  = UILabel()
        idText.textAlignment = .left
        idText.text = "   \(Auth.auth().currentUser?.uid ?? "USERID")"
        idText.textColor = lacivert
        idText.font = UIFont(name: "Gilroy-Medium", size: 16 * stringMultiplier)
        idText.frame = CGRect(x: 0.1 * screenWidth, y: 0.56 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        idText.layer.borderWidth = 1
        idText.layer.cornerRadius = 12
        view.addSubview(idText)
        
        let kartButton = UIButton()
        kartButton.setTitleColor(.white, for: .normal)
        kartButton.setTitle("Kahve Kartı", for: .normal)
        kartButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.74 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        kartButton.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 16 * stringMultiplier)
        kartButton.layer.cornerRadius = 12
        kartButton.backgroundColor = yesil
        view.addSubview(kartButton)
        kartButton.addTarget(self, action: #selector(kahveKartiClicked), for: .touchUpInside)
        
        let cikisButton  = UIButton()
        cikisButton.setTitleColor(.white, for: .normal)
        cikisButton.setTitle("Çıkış Yap", for: .normal)
        cikisButton.backgroundColor = lacivert
        cikisButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.82 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        cikisButton.layer.cornerRadius = 12
        cikisButton.titleLabel?.font = UIFont(name: "Gilroy-Bold", size: 16 * stringMultiplier)
        view.addSubview(cikisButton)
        cikisButton.addTarget(self, action: #selector(cikisClicked), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func backClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func kahveKartiClicked() {
        presentAsPageSheet(currentVC: self, destinationVC: QRCodeVC())
    }
    @objc func cikisClicked() {
    
        do {
            try Auth.auth().signOut()
            presentVC(currentVC: self, destinationVC: LoginVC(), toDirection: .down)
        } catch {
            showCustomAlert(title: "Hata", message: "Çıkış işlemi sırasında bir hata oluştu!", viewController: self)
        }
    }

    
}
