//
//  LoginVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 23.01.2022.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    
    let emailField  = UITextField()
    let passField  = UITextField()
    let kayitYonlendirmeText = UILabel()
    let eyeButton  = UIButton()
    var iconClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        createUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    func createUI(){
 
        view.backgroundColor = UIColor.white
        
        let mainImg = UIImageView()
        mainImg.image = UIImage(named: "logo_original")
        mainImg.frame = CGRect(x: 0.17 * screenWidth, y: 0.14 * screenHeight, width: 0.66 * screenWidth, height: 0.3 * screenHeight)
        view.addSubview(mainImg)
        
    
        let kayıtYonlendirmeText  = UILabel()
        kayıtYonlendirmeText.textAlignment = .left
        kayıtYonlendirmeText.text = NSLocalizedString("Kaydınızı Oluşturun", comment: "")
        kayıtYonlendirmeText.textColor = .black
        kayıtYonlendirmeText.font = UIFont(name: "Gilroy-Medium", size: 18 * stringMultiplier)
        kayıtYonlendirmeText.frame = CGRect(x: 0.1 * screenWidth, y: 0.5 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(kayıtYonlendirmeText)
        
        
        emailField.layer.borderWidth = 1
        emailField.autocapitalizationType = .none
        emailField.layer.borderColor = lacivert.cgColor
        emailField.placeholder = "Email Adresinizi Giriniz..."
        emailField.frame = CGRect(x: 0.1 * screenWidth, y: 0.55 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        emailField.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
        emailField.textColor = lacivert
        emailField.backgroundColor = .clear
        emailField.layer.cornerRadius = 12
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: emailField.frame.height))
        emailField.leftView = paddingView
        emailField.leftViewMode = UITextField.ViewMode.always
        self.view.addSubview(emailField)
        
        
        passField.layer.borderWidth = 1
        passField.layer.borderColor = lacivert.cgColor
        passField.placeholder = "Şifrenizi Giriniz..."
        passField.frame = CGRect(x: 0.1 * screenWidth, y: 0.62 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        passField.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
        passField.textColor = lacivert
        passField.backgroundColor = .clear
        passField.layer.cornerRadius = 12
        passField.layer.masksToBounds = true
        
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: passField.frame.height))
        passField.leftView = paddingView2
        passField.leftViewMode = UITextField.ViewMode.always
        passField.isSecureTextEntry = true
        self.view.addSubview(passField)
        
        
        let girisButton  = UIButton()
        girisButton.backgroundColor = acikYesil
        girisButton.setTitleColor(.white, for: .normal)
        girisButton.setTitle("Giriş Yap", for: .normal)
        
        
        girisButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.75 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        girisButton.contentVerticalAlignment.self = .center
        girisButton.layer.cornerRadius = 10
        girisButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
        girisButton.contentHorizontalAlignment.self = .center
        
        view.addSubview(girisButton)
        girisButton.addTarget(self, action: #selector(girisButtonClicked), for: .touchUpInside)
        
        
        eyeButton.backgroundColor = .clear
        eyeButton.setBackgroundImage(UIImage(named: "eye" ), for: UIControl.State.normal)
        eyeButton.frame = CGRect(x: 0.795 * screenWidth, y: 0.637 * screenHeight, width: 0.066 * screenWidth, height: 0.066 * screenWidth)
        view.addSubview(eyeButton)
        eyeButton.addTarget(self, action: #selector(eyeClicked), for: .touchUpInside)
        
        let sifremiUnuttum  = UIButton()
        sifremiUnuttum.backgroundColor = .clear
        sifremiUnuttum.setTitleColor(lacivert, for: .normal)
        sifremiUnuttum.setTitle("Şifremi Unuttum", for: .normal)
        sifremiUnuttum.frame = CGRect(x: 0.08 * screenWidth, y: 0.69 * screenHeight, width: 0.3 * screenWidth, height: 0.03 * screenHeight)
        sifremiUnuttum.contentVerticalAlignment.self = .center
        sifremiUnuttum.layer.cornerRadius = 12
        sifremiUnuttum.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 12 * stringMultiplier)
        sifremiUnuttum.contentHorizontalAlignment.self = .center
        view.addSubview(sifremiUnuttum)
        sifremiUnuttum.addTarget(self, action: #selector(sifremiUnuttumClicked), for: .touchUpInside)
        
        kayıtYonlendirmeText.textAlignment = .center
        kayıtYonlendirmeText.text = NSLocalizedString("Henüz bir hesabınız yok mu?", comment: "")
        kayıtYonlendirmeText.textColor = lacivert
        kayıtYonlendirmeText.font = UIFont(name: "Gilroy-Medium", size: 15 * stringMultiplier)
        kayıtYonlendirmeText.frame = CGRect(x: 0.1 * screenWidth, y: 0.82 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(kayıtYonlendirmeText)
        
        let kayitOl  = UIButton()
        kayitOl.setTitleColor(acikYesil, for: .normal)
        kayitOl.setTitle("Kayıt Ol", for: .normal)
        kayitOl.frame = CGRect(x: 0.3 * screenWidth, y: 0.86 * screenHeight, width: 0.4 * screenWidth, height: 0.06 * screenHeight)
        kayitOl.contentVerticalAlignment.self = .center
        kayitOl.titleLabel?.font = UIFont(name: "Gilroy-Bold", size: 18 * stringMultiplier)
        kayitOl.contentHorizontalAlignment.self = .center
        view.addSubview(kayitOl)
        
        kayitOl.addTarget(self, action: #selector(kayitOlClicked), for: .touchUpInside)
        
        
    }
    
    
    @objc func sifremiUnuttumClicked() {
        vibrate(style: .heavy)
        print("click")
    }
    
    @objc func eyeClicked(sender: AnyObject) {
        if(iconClick == true) {
            passField.isSecureTextEntry = false
            eyeButton.setBackgroundImage(UIImage(named: "eye" ), for: UIControl.State.normal)
        } else {
            passField.isSecureTextEntry = true
            eyeButton.setBackgroundImage(UIImage(named: "close_eye" ), for: UIControl.State.normal)
            
        }
        
        iconClick = !iconClick
    }
    
    
    
    @objc func girisButtonClicked() {
        vibrate(style: .heavy)
        
        if emailField.text != "" && passField.text != ""  {
            Auth.auth().signIn(withEmail: emailField.text!, password: passField.text!) { authDataResult, error in
                if error != nil{
                    showCustomAlert(title: NSLocalizedString("Hata!", comment: ""), message: NSLocalizedString(error?.localizedDescription ?? "Hata oluştu, lütfen daha sonra tekrar deneyiniz.", comment: ""), viewController: self)
                    self.navigationController?.popViewController(animated: true)
                }else{
                    
                    presentVC(currentVC: self, destinationVC: MainVC(), toDirection: .left)
                    
                }
                
            }
        }else{
            //     email ve şifre boş ise hata mesajı
            showCustomAlert(title: NSLocalizedString("Hata!", comment: ""), message: NSLocalizedString("Lütfen e-mail adresinizi ve şifrenizi eksiksiz giriniz!", comment: ""), viewController: self)
            self.navigationController?.popViewController(animated: true)
            
        }
        
    }
    
    
    @objc func kayitOlClicked() {
        
        presentAsPageSheet(currentVC: self, destinationVC: SignUpVC())
        
    }
    
    
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    
    
}
