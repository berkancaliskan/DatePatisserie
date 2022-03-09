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
    let kayıtYonlendirmeText  = UILabel()
    let passField  = UITextField()
    let kayitYonlendirmeText = UILabel()
    
    let eyeButton  = UIButton()
    
    var iconClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

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
            
     

//        let label  = UILabel()
//        label.textAlignment = .center
//        label.text = NSLocalizedString("Date Patisserie", comment: "")
//        label.textColor = UIColor(red: 1.00, green: 0.32, blue: 0.00, alpha: 1.00)
//        label.numberOfLines = 0
//        label.font = UIFont(name: "Gilroy-Bold", size: 22 * stringMultiplier)
//        label.frame = CGRect(x: 0.1 * screenWidth, y: 0.07 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
//        view.addSubview(label)
//

        kayıtYonlendirmeText.textAlignment = .left
        kayıtYonlendirmeText.text = NSLocalizedString("Kaydınızı Oluşturun", comment: "")
        kayıtYonlendirmeText.textColor = .black
        kayıtYonlendirmeText.font = UIFont(name: "Gilroy-Medium", size: 18 * stringMultiplier)
        kayıtYonlendirmeText.frame = CGRect(x: 0.1 * screenWidth, y: 0.5 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(kayıtYonlendirmeText)
        

        emailField.layer.borderWidth = 1
        emailField.autocapitalizationType = .none
        emailField.layer.borderColor = UIColor.systemOrange.cgColor
        emailField.placeholder = "📧 Email Adresinizi Giriniz..."
        emailField.frame = CGRect(x: 0.1 * screenWidth, y: 0.55 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        emailField.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
        emailField.textColor = UIColor.black
        emailField.backgroundColor = acikGri
        emailField.layer.cornerRadius = 12
            
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: emailField.frame.height))
        emailField.leftView = paddingView
        emailField.leftViewMode = UITextField.ViewMode.always
        self.view.addSubview(emailField)


        passField.layer.borderWidth = 1
        passField.layer.borderColor = UIColor.systemOrange.cgColor
        passField.placeholder = "🔐 Şifrenizi Giriniz..."
        passField.frame = CGRect(x: 0.1 * screenWidth, y: 0.62 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        passField.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
        passField.textColor = UIColor.black
        passField.backgroundColor = acikGri
        passField.layer.cornerRadius = 12
        passField.layer.masksToBounds = true
            
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: passField.frame.height))
        passField.leftView = paddingView2
        passField.leftViewMode = UITextField.ViewMode.always
        passField.isSecureTextEntry = true
        self.view.addSubview(passField)
                
        
        let girisButton  = UIButton()
        girisButton.backgroundColor = .clear
        girisButton.setTitleColor(.white, for: .normal)
        girisButton.setTitle("Giriş Yap", for: .normal)
        girisButton.setBackgroundImage(UIImage(named: "btn_giris" ), for: UIControl.State.normal)
        girisButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.75 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        
        girisButton.contentVerticalAlignment.self = .center
        girisButton.titleLabel?.font = UIFont(name: "Gilroy-Bold", size: 20 * stringMultiplier)
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
        sifremiUnuttum.setTitleColor(.orange, for: .normal)
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
        kayıtYonlendirmeText.textColor = .systemOrange
        kayıtYonlendirmeText.font = UIFont(name: "Gilroy-Medium", size: 15 * stringMultiplier)
        kayıtYonlendirmeText.frame = CGRect(x: 0.1 * screenWidth, y: 0.82 * screenHeight, width: 0.8 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(kayıtYonlendirmeText)
            
        let kayitOl  = UIButton()
        kayitOl.backgroundColor = .clear
            kayitOl.setTitleColor(.systemGreen, for: .normal)
        kayitOl.setTitle("Kayıt Ol", for: .normal)
        kayitOl.frame = CGRect(x: 0.3 * screenWidth, y: 0.86 * screenHeight, width: 0.4 * screenWidth, height: 0.06 * screenHeight)
        kayitOl.layer.borderColor = UIColor.systemGreen.cgColor
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
                    self.showCustomAlert(title: NSLocalizedString("Hata!", comment: ""), message: NSLocalizedString(error?.localizedDescription ?? "Hata oluştu, lütfen daha sonra tekrar deneyiniz.", comment: ""), viewController: self)
                    self.navigationController?.popViewController(animated: true)
                }else{
                    
                    self.performSegue(withIdentifier: "loginToMain", sender: nil)
                    
                }
            
            }
        }else{
            //     email ve şifre boş ise hata mesajı
                        showCustomAlert(title: NSLocalizedString("Hata!", comment: ""), message: NSLocalizedString("Lütfen e-mail adresinizi ve şifrenizi eksiksiz giriniz!", comment: ""), viewController: self)
                        self.navigationController?.popViewController(animated: true)
                        
        }
        
    }
    
    
    @objc func kayitOlClicked() {
        
        performSegue(withIdentifier: "loginToSign", sender: nil)

    }
    

    func showCustomAlert(title: String, message: String,  viewController : UIViewController){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)

    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
