//
//  SignUpVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 29.01.2022.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpVC: UIViewController {
    
    
    let kayitEmailField = UITextField()
    let kayitSifreTextField2 = UITextField()
    let loginText  = UILabel()
    let kayitSifreTextField = UITextField()
    
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
        mainImg.image = UIImage(named: "logo_original")
        mainImg.frame = CGRect(x: 0.17 * screenWidth, y: 0.14 * screenHeight, width: 0.66 * screenWidth, height: 0.3 * screenHeight)
        view.addSubview(mainImg)
        
        let downImg = UIImageView()
        downImg.image = UIImage(named: "down")
        downImg.frame = CGRect(x: 0.45 * screenWidth, y: 0.02 * screenHeight, width: 0.1 * screenWidth, height: 0.027 * screenHeight)
        view.addSubview(downImg)
        
        
        
        loginText.textAlignment = .left
        loginText.text = NSLocalizedString("Kaydını Oluştur", comment: "")
        loginText.textColor = lacivert
        loginText.font = UIFont(name: "Gilroy-Medium", size: 18 * stringMultiplier)
        loginText.frame = CGRect(x: 0.1 * screenWidth, y: 0.48 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(loginText)
        
        kayitEmailField.autocapitalizationType = .none
        kayitEmailField.layer.borderWidth = 1
        kayitEmailField.layer.borderColor = lacivert.cgColor
        kayitEmailField.frame = CGRect(x: 0.1 * screenWidth, y: 0.53 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        kayitEmailField.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
        kayitEmailField.textColor = lacivert
        kayitEmailField.backgroundColor = .clear
        kayitEmailField.layer.cornerRadius = 12
        kayitEmailField.attributedPlaceholder = NSAttributedString(
            string: "Email Adresinizi Giriniz...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        )
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: kayitEmailField.frame.height))
        kayitEmailField.leftView = paddingView
        kayitEmailField.leftViewMode = UITextField.ViewMode.always
        self.view.addSubview(kayitEmailField)
        
        kayitSifreTextField.autocapitalizationType = .none
        kayitSifreTextField.layer.borderWidth = 1
        kayitSifreTextField.layer.borderColor = lacivert.cgColor
        kayitSifreTextField.frame = CGRect(x: 0.1 * screenWidth, y: 0.60 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        kayitSifreTextField.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
        kayitSifreTextField.textColor = lacivert
        kayitSifreTextField.backgroundColor = .clear
        kayitSifreTextField.layer.cornerRadius = 12
        kayitSifreTextField.layer.masksToBounds = true
        kayitSifreTextField.attributedPlaceholder = NSAttributedString(
            string: "Şifrenizi Giriniz...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        )
        
        let paddingView3 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: kayitSifreTextField.frame.height))
        kayitSifreTextField.leftView = paddingView3
        kayitSifreTextField.leftViewMode = UITextField.ViewMode.always
        kayitSifreTextField.isSecureTextEntry = false
        self.view.addSubview(kayitSifreTextField)
        
        kayitSifreTextField2.autocapitalizationType = .none
        kayitSifreTextField2.layer.borderWidth = 1
        kayitSifreTextField2.layer.borderColor = lacivert.cgColor
 
        kayitSifreTextField2.frame = CGRect(x: 0.1 * screenWidth, y: 0.67 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        kayitSifreTextField2.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
        kayitSifreTextField2.textColor = lacivert
        kayitSifreTextField2.backgroundColor = .clear
        kayitSifreTextField2.layer.cornerRadius = 12
        kayitSifreTextField2.layer.masksToBounds = true
        kayitSifreTextField2.attributedPlaceholder = NSAttributedString(string: "Şifrenizi Doğrulayın",
                                                                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
    
        let paddingView4 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: kayitSifreTextField2.frame.height))
        kayitSifreTextField2.leftView = paddingView4
        kayitSifreTextField2.leftViewMode = UITextField.ViewMode.always
        kayitSifreTextField2.isSecureTextEntry = false
 
    
        self.view.addSubview(kayitSifreTextField2)
        
        
        let kayitOl  = UIButton()
        kayitOl.setTitleColor(.white, for: .normal)
        kayitOl.setTitle("Kayıt Ol", for: .normal)
        kayitOl.backgroundColor = yesil
        kayitOl.frame = CGRect(x: 0.1 * screenWidth, y: 0.76 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        kayitOl.contentVerticalAlignment.self = .center
        kayitOl.layer.cornerRadius = 10
        kayitOl.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 18 * stringMultiplier)
        kayitOl.contentHorizontalAlignment.self = .center
        view.addSubview(kayitOl)
        
        kayitOl.addTarget(self, action: #selector(kayitOlClicked), for: .touchUpInside)
        
    }
    
    @objc func sifremiUnuttumClicked() {
        print("click")
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func authFirebase(){
        
        Auth.auth().createUser(withEmail: profileInfo.mailaddress, password: profileInfo.password) { authDataResult, error in
            if error != nil{
                showCustomAlert(title: NSLocalizedString("Hata!", comment: ""),
                                message: NSLocalizedString(error?.localizedDescription ?? "Hata oluştu, lütfen daha sonra tekrar deneyiniz.", comment: ""),
                                
                                viewController: self)
                
            }else{
                
                let successAlert = UIAlertController(title: "Başarılı",
                                                     message: "Kaydınız başarıyla oluşturuldu 🎉 ",
                                                     preferredStyle: UIAlertController.Style.alert)
                
                successAlert.addAction(UIAlertAction(title: "Giriş",
                                                     style: .default,
                                                     handler: { (action: UIAlertAction!) in
                    
                    let vc = LoginVC()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                    
                }))
                
                self.present(successAlert, animated: true, completion: nil)
                
            }
            
        }
    }
    
    @objc func kayitOlClicked() {
        
        
        if (kayitSifreTextField.text == kayitSifreTextField2.text){
            
            if kayitEmailField.text != ""{
                
                if isValidEmail(kayitEmailField.text!){
                    
                    let searchStr = kayitEmailField.text?.hasSuffix("istinye.edu.tr")
                    
                    if searchStr == true {
                        
                        authFirebase()
                        
                        Auth.auth().currentUser?.sendEmailVerification { error in
                            
                            if error != nil{
                                showCustomAlert(title: "OOPPPPSS✋🏻...",
                                                message: "E-mail doğrulaması yapmalısın.",
                                                viewController: self)
                                

                                print("sdsfsdgd")
                                print("dsfsesfse \(error?.localizedDescription)")
                                
                            }
                            
                        }
                        
                    }else{
                        
                        //istinye ile bitmiyor
                        showCustomAlert(title: "OOPPPPSS✋🏻...",
                                        message: "Email adresin @istinye.edu.tr ile bitmelidir.",
                                        viewController: self)
                        
                    }}else{
                        
                        // Email adresi yanlış
                        
                        showCustomAlert(title: "OOPPPPSS✋🏻...",
                                        message: "Email adresinde geçersiz karakterler kullanmamalısın.",
                                        viewController: self)
                    }}else{
                        
                        
                        // Email boş
                        showCustomAlert(title: "OOPPPPSS✋🏻...",
                                        message: "Email adresini boş bırakamazsın",
                                        viewController: self)
                        
                    }}else{
                        
                        // şifreler eşleşmiyor
                        showCustomAlert(title: "OOPPPPSS✋🏻...",
                                        message: "Şifreler eşleşmiyor, tekrar dene",
                                        viewController: self)
                        
                    }
    }
}
