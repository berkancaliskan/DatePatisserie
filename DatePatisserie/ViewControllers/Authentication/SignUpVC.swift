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
    
    let nameTextField =  UITextField()
    let surnameTextField =  UITextField()
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let passwordTextField2 = UITextField()
    let loginText  = UILabel()

    
    
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
        mainImg.frame = CGRect(x: 0.17 * screenWidth, y: 0.12 * screenHeight, width: 0.66 * screenWidth, height: 0.3 * screenHeight)
        view.addSubview(mainImg)
        mainImg.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        let downImg = UIImageView()
        downImg.image = UIImage(named: "down")
        downImg.frame = CGRect(x: 0.45 * screenWidth, y: 0.02 * screenHeight, width: 0.1 * screenWidth, height: 0.027 * screenHeight)
        view.addSubview(downImg)
        
        
        loginText.textAlignment = .left
        loginText.text = NSLocalizedString("Kaydını Oluştur", comment: "")
        loginText.textColor = lacivert
        loginText.font = UIFont(name: "Gilroy-Medium", size: 18 * stringMultiplier)
        loginText.frame = CGRect(x: 0.1 * screenWidth, y: 0.39 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(loginText)
        
        
 
        nameTextField.makeCustomTextField(view: view, yPozition: 0.45, isSecureText: false, placeholder: "Adınızı Giriniz")

        surnameTextField.makeCustomTextField(view: view, yPozition: 0.52, isSecureText: false, placeholder: "Soyadınızı Giriniz")
     
        emailTextField.makeCustomTextField(view: view, yPozition: 0.59, isSecureText: false, placeholder: "E-Posta Adresinizi Giriniz")
        
        passwordTextField.makeCustomTextField(view: view, yPozition: 0.66, isSecureText: true, placeholder: "Şifrenizi Giriniz")

        passwordTextField2.makeCustomTextField(view: view, yPozition: 0.73, isSecureText: true, placeholder: "Şifrenizi Doğrulayınız")
       
        
        
        let kayitOl  = UIButton()
        kayitOl.setTitleColor(.white, for: .normal)
        kayitOl.setTitle("Kayıt Ol", for: .normal)
        kayitOl.backgroundColor = yesil
        kayitOl.frame = CGRect(x: 0.1 * screenWidth, y: 0.82 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        kayitOl.contentVerticalAlignment.self = .center
        kayitOl.layer.cornerRadius = 10
        kayitOl.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 18 * stringMultiplier)
        kayitOl.contentHorizontalAlignment.self = .center
        view.addSubview(kayitOl)
        
        kayitOl.addTarget(self, action: #selector(kayitOlClicked), for: .touchUpInside)
        
    }
    

    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func updateProfileItems(){
        
        
        profileInfo.mailaddress = emailTextField.text!
        profileInfo.password = passwordTextField2.text!
        profileInfo.name = nameTextField.text!
        profileInfo.surname = surnameTextField.text!
    
        
    }
    
    func authFirebase(){
        
        updateProfileItems()
        
        
        Auth.auth().createUser(withEmail: profileInfo.mailaddress, password: profileInfo.password ) { authDataResult, error in
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
        
        
        if (passwordTextField.text == passwordTextField2.text){
            
            if emailTextField.text != ""{
                
                if isValidEmail(emailTextField.text!){
                    
                    let searchStr = emailTextField.text?.hasSuffix("istinye.edu.tr")
                    
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
