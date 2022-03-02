//
//  SignUpVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 29.01.2022.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    
    let kayitEmailField  = UITextField()
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
        downImg.frame = CGRect(x: 0.45 * screenWidth, y: 0.02 * screenHeight, width: 0.1 * screenWidth, height: 0.04 * screenHeight)
        view.addSubview(downImg)
            
            
     
        loginText.textAlignment = .left
        loginText.text = NSLocalizedString("Kaydını Oluştur", comment: "")
        loginText.textColor = .black
        loginText.font = UIFont(name: "Gilroy-Medium", size: 18 * stringMultiplier)
        loginText.frame = CGRect(x: 0.1 * screenWidth, y: 0.495 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(loginText)
        

        kayitEmailField.layer.borderWidth = 1
        kayitEmailField.layer.borderColor = UIColor.systemOrange.cgColor
        kayitEmailField.placeholder = "Email Adresinizi Giriniz..."
        kayitEmailField.frame = CGRect(x: 0.1 * screenWidth, y: 0.55 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        kayitEmailField.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
        kayitEmailField.textColor = UIColor.black
        kayitEmailField.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.95, alpha: 1.00)
        kayitEmailField.layer.cornerRadius = 12
            
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: kayitEmailField.frame.height))
        kayitEmailField.leftView = paddingView
        kayitEmailField.leftViewMode = UITextField.ViewMode.always
        self.view.addSubview(kayitEmailField)


        kayitSifreTextField.layer.borderWidth = 1
        kayitSifreTextField.layer.borderColor = UIColor.systemOrange.cgColor
        kayitSifreTextField.placeholder = "Şifrenizi Giriniz..."
        kayitSifreTextField.frame = CGRect(x: 0.1 * screenWidth, y: 0.62 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        kayitSifreTextField.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
        kayitSifreTextField.textColor = UIColor.black
        kayitSifreTextField.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.95, alpha: 1.00)
        kayitSifreTextField.layer.cornerRadius = 12
        kayitSifreTextField.layer.masksToBounds = true
                
        let paddingView3 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: kayitSifreTextField.frame.height))
        kayitSifreTextField.leftView = paddingView3
        kayitSifreTextField.leftViewMode = UITextField.ViewMode.always
        kayitSifreTextField.isSecureTextEntry = true
        self.view.addSubview(kayitSifreTextField)
                    
        
        let kayitOl  = UIButton()
        kayitOl.setBackgroundImage(UIImage(named: "btn_giris" ), for: UIControl.State.normal)
        kayitOl.setTitleColor(.white, for: .normal)
        kayitOl.setTitle("Kayıt Ol", for: .normal)
        kayitOl.layer.borderWidth = 1
        kayitOl.frame = CGRect(x: 0.1 * screenWidth, y: 0.72 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        kayitOl.layer.borderColor = UIColor.systemGreen.cgColor
        kayitOl.contentVerticalAlignment.self = .center
        kayitOl.layer.cornerRadius = 12
        kayitOl.titleLabel?.font = UIFont(name: "Gilroy-Bold", size: 18 * stringMultiplier)
        kayitOl.contentHorizontalAlignment.self = .center
        view.addSubview(kayitOl)
                
        kayitOl.addTarget(self, action: #selector(kayitOlClicked), for: .touchUpInside)
            
        // Do any additional setup after loading the view.
    }
    
    @objc func sifremiUnuttumClicked() {
        print("click")
    }
    
    @objc func kayitOlClicked() {
        vibrate(style: .heavy)
        if kayitEmailField.text != "" && kayitSifreTextField.text != ""  {
            Auth.auth().createUser(withEmail: kayitEmailField.text!, password: kayitSifreTextField.text!) { authDataResult, error in
                if error != nil{
                    showCustomAlert(title: NSLocalizedString("Hata!", comment: ""), message: NSLocalizedString(error?.localizedDescription ?? "Hata oluştu, lütfen daha sonra tekrar deneyiniz.", comment: ""), viewController: self)
                    self.navigationController?.popViewController(animated: true)
                }else{
                    showCustomAlert(title: NSLocalizedString("Başarılı!", comment: ""), message: NSLocalizedString(error?.localizedDescription ?? "Kaydınız başarıyla oluşturuldu. Giriş yapabilirsiniz.", comment: ""), viewController: self)
                    self.navigationController?.popViewController(animated: true)
                    
                    
                }
            }
            
        } else {
            
//     email ve şifre boş ise hata mesajı
            showCustomAlert(title: NSLocalizedString("Hata!", comment: ""), message: NSLocalizedString("Lütfen kayıt işlemi için e-mail adresinizi ve şifrenizi eksiksiz giriniz!", comment: ""), viewController: self)
            self.navigationController?.popViewController(animated: true)
            
        }
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
