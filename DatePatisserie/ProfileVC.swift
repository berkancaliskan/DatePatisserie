//
//  ProfileVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 22.01.2022.
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

//        let label  = UILabel()
//        label.textAlignment = .center
//        label.text = NSLocalizedString("Date Patisserie", comment: "")
//        label.textColor = UIColor(red: 1.00, green: 0.32, blue: 0.00, alpha: 1.00)
//        label.numberOfLines = 0
//        label.font = UIFont(name: "Gilroy-Bold", size: 22 * stringMultiplier)
//        label.frame = CGRect(x: 0.1 * screenWidth, y: 0.07 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
//        view.addSubview(label)
//
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
            

//        let emailField  = UITextField()
//            emailField.layer.borderWidth = 1
//        emailField.layer.borderColor = UIColor.systemOrange.cgColor
//        emailField.placeholder = "Email Adresinizi Giriniz..."
//        emailField.frame = CGRect(x: 0.1 * screenWidth, y: 0.55 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
//        emailField.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
//        emailField.textColor = UIColor.black
//        emailField.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.95, alpha: 1.00)
//        emailField.layer.cornerRadius =
//
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: emailField.frame.height))
//        emailField.leftView = paddingView
//        emailField.leftViewMode = UITextField.ViewMode.always

            
//        self.view.addSubview(emailField)

//        let passField  = UITextField()
//            passField.layer.borderWidth = 1
//        passField.layer.borderColor = UIColor.systemOrange.cgColor
//        passField.placeholder = "Şifrenizi Giriniz..."
//        passField.frame = CGRect(x: 0.1 * screenWidth, y: 0.62 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
//        passField.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
//        passField.textColor = UIColor.black
//        passField.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.95, alpha: 1.00)
//        passField.layer.cornerRadius = 12
//        passField.layer.masksToBounds = true
//
//        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: passField.frame.height))
//        passField.leftView = paddingView2
//        passField.leftViewMode = UITextField.ViewMode.always
//        passField.isSecureTextEntry = true
//        self.view.addSubview(passField)
                
        
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
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
