//
//  ProfileVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 26.01.2022.
//

import UIKit

class ProfileVC: UIViewController {
    
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
        
        
        let mainImg = UIImageView()
        mainImg.image = UIImage(named: "profile_img")
        mainImg.frame = CGRect(x: 0.3 * screenWidth, y: 0.146 * screenHeight, width: 0.4 * screenWidth, height: 0.4 * screenWidth)
        view.addSubview(mainImg)
        
        let backButton = UIButton()
        backButton.makeBackButton(view: view, selector: #selector(backClicked), VC: self)
        
        let nameText  = UILabel()
        nameText.textAlignment = .center
        nameText.text = NSLocalizedString("Berkan Çalışkan", comment: "")
        nameText.textColor = .black
        nameText.font = UIFont(name: "Gilroy-Medium", size: 20 * stringMultiplier)
        nameText.layer.cornerRadius = 12
        nameText.frame = CGRect(x: 0.1 * screenWidth, y: 0.37 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(nameText)
        
        
        let mailText  = UILabel()
        mailText.textAlignment = .left
        mailText.text = NSLocalizedString("  berkancaliskan@apple.com", comment: "")
        mailText.textColor = .black
        mailText.font = UIFont(name: "Gilroy-Medium", size: 16 * stringMultiplier)
        mailText.frame = CGRect(x: 0.1 * screenWidth, y: 0.45 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        mailText.layer.borderWidth = 1
        mailText.layer.cornerRadius = 12
        view.addSubview(mailText)
        
        let idText  = UILabel()
        idText.textAlignment = .left
        idText.text = NSLocalizedString("  DC457293", comment: "")
        idText.textColor = .black
        idText.font = UIFont(name: "Gilroy-Medium", size: 16 * stringMultiplier)
        idText.frame = CGRect(x: 0.1 * screenWidth, y: 0.52 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        idText.layer.borderWidth = 1
        idText.layer.cornerRadius = 12
        view.addSubview(idText)
        
        
        
        let kartButton = UIButton()
        kartButton.backgroundColor = .clear
        kartButton.setTitleColor(.white, for: .normal)
        kartButton.setTitle("Kahve Kartı", for: .normal)
        kartButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.74 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        kartButton.contentVerticalAlignment.self = .center
        kartButton.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 14 * stringMultiplier)
        kartButton.contentHorizontalAlignment.self = .center
        kartButton.layer.cornerRadius = 12
        kartButton.backgroundColor = yesil
        
        
        view.addSubview(kartButton)
        kartButton.addTarget(self, action: #selector(kahveKartiClicked), for: .touchUpInside)
        
        
        let cikisButton  = UIButton()
        
        cikisButton.setTitleColor(.white, for: .normal)
        cikisButton.setTitle("Çıkış", for: .normal)
        cikisButton.backgroundColor = lacivert
        cikisButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.82 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        cikisButton.contentVerticalAlignment.self = .center
        cikisButton.layer.cornerRadius = 12
        cikisButton.titleLabel?.font = UIFont(name: "Gilroy-Bold", size: 14 * stringMultiplier)
        cikisButton.contentHorizontalAlignment.self = .center
        view.addSubview(cikisButton)
        
        cikisButton.addTarget(self, action: #selector(kayitOlClicked), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    
    //
    
    
    @objc func backClicked() {
        vibrate(style: .heavy)
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    @objc func kahveKartiClicked() {
        presentAsPageSheet(currentVC: self, destinationVC: QRCodeVC())
    }
    @objc func kayitOlClicked() {
        print("click")
    }
    @objc func sifremiUnuttumClicked() {
        print("click")
    }
    
    
    
    
}
