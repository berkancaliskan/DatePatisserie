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
        createUI()

    }
        func createUI(){
            
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        let stringMultiplier = 0.00115 * screenHeight
        
        view.backgroundColor = UIColor.white
            
        let mainImg = UIImageView()
        mainImg.image = UIImage(named: "profile_img")
        mainImg.frame = CGRect(x: 0.17 * screenWidth, y: 0.07 * screenHeight, width: 0.66 * screenWidth, height: 0.3 * screenHeight)
        view.addSubview(mainImg)
            
        let backButton = UIButton()
        backButton.setBackgroundImage(UIImage(named: "back_btn"), for: UIControl.State.normal)
        backButton.frame = CGRect(x: 0.04 * screenWidth, y: 0.07 * screenHeight, width: 0.06 * screenWidth, height: 0.024 * screenHeight)
        backButton.contentVerticalAlignment.self = .center
        backButton.contentHorizontalAlignment.self = .center
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backClicked), for: UIControl.Event.touchUpInside)


        let nameText  = UILabel()
        nameText.textAlignment = .center
        nameText.text = NSLocalizedString("Berkan Çalışkan", comment: "")
        nameText.textColor = .black
        nameText.font = UIFont(name: "Gilroy-Medium", size: 20 * stringMultiplier)
//        nameText.layer.borderWidth = 1
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
            
        
        
        let girisButton = UIButton()
        girisButton.backgroundColor = .clear
        girisButton.setTitleColor(.black, for: .normal)
        girisButton.setTitle("Kahve Kartı", for: .normal)
        girisButton.setBackgroundImage(UIImage(named: "kahve_karti" ), for: UIControl.State.normal)
        girisButton.frame = CGRect(x: 0.05 * screenWidth, y: 0.72 * screenHeight, width: 0.9 * screenWidth, height: 0.1 * screenHeight)

        girisButton.contentVerticalAlignment.self = .center
        girisButton.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 14 * stringMultiplier)
        girisButton.contentHorizontalAlignment.self = .center

        view.addSubview(girisButton)
        girisButton.addTarget(self, action: #selector(girisButtonClicked), for: .touchUpInside)
            
        let profiliDüzenle  = UIButton()
        profiliDüzenle.backgroundColor = .clear
        profiliDüzenle.setTitleColor(.orange, for: .normal)
        profiliDüzenle.setTitle("Profili Düzenle", for: .normal)
        profiliDüzenle.frame = CGRect(x: 0.7 * screenWidth, y: 0.077 * screenHeight, width: 0.3 * screenWidth, height: 0.03 * screenHeight)
        profiliDüzenle.contentVerticalAlignment.self = .center
        profiliDüzenle.layer.cornerRadius = 12
        profiliDüzenle.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 12 * stringMultiplier)
        profiliDüzenle.contentHorizontalAlignment.self = .center
        view.addSubview(profiliDüzenle)
        profiliDüzenle.addTarget(self, action: #selector(sifremiUnuttumClicked), for: .touchUpInside)
            
        
            
        let kayitOl  = UIButton()

            kayitOl.setTitleColor(.black, for: .normal)
        kayitOl.setTitle("Çıkış", for: .normal)

        kayitOl.setBackgroundImage(UIImage(named: "cikis_btn" ), for: UIControl.State.normal)
        kayitOl.frame = CGRect(x: 0.1 * screenWidth, y: 0.82 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        kayitOl.contentVerticalAlignment.self = .center
        kayitOl.layer.cornerRadius = 12
        kayitOl.titleLabel?.font = UIFont(name: "Gilroy-Bold", size: 14 * stringMultiplier)
        kayitOl.contentHorizontalAlignment.self = .center
        view.addSubview(kayitOl)
                
        kayitOl.addTarget(self, action: #selector(kayitOlClicked), for: .touchUpInside)
            
        // Do any additional setup after loading the view.
    }
    
    
//
    
    
    @objc func backClicked() {
        vibrate(style: .heavy)
        dismiss(animated: true, completion: nil)
        

    }
    
    
    @objc func girisButtonClicked() {
        print("click")
    }
    @objc func kayitOlClicked() {
        print("click")
    }
    @objc func sifremiUnuttumClicked() {
        print("click")
    }
    

    

}
