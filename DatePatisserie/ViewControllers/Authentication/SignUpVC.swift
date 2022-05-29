//
//  SignUpVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 29.01.2022.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpVC: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let scrollview = UIScrollView()
    
    let nameTextField =  UITextField()
    let surnameTextField =  UITextField()
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let passwordTextField2 = UITextField()
    let loginText  = UILabel()
    let profileImg = UIImageView()
    let changePhotoButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefaultSize(view: view)
        createScrollView()
        createUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    func createScrollView(){
        
        scrollview.frame = CGRect(x: 0, y: 0.08 * screenHeight , width: screenWidth, height: screenHeight)
        scrollview.contentSize = CGSize(width: screenWidth , height: screenHeight * 1.4)
        scrollview.alwaysBounceVertical = true
        scrollview.delegate = self
        scrollview.backgroundColor = .clear
        view.addSubview(scrollview)
        
    }
    
    func createUI(){
        
      
        view.backgroundColor = UIColor.white
        profileImg.image = UIImage(named: "profile_img")
        profileImg.layer.borderWidth = 1
        profileImg.layer.borderColor = yesil.cgColor
        profileImg.layer.cornerRadius = 0.25 * screenWidth
        
        profileImg.frame = CGRect(x: view.frame.midX - 0.25 * screenWidth, y: 0.02 * screenHeight, width: 0.5 * screenWidth, height: 0.5 * screenWidth)
        scrollview.addSubview(profileImg)
        profileImg.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        profileImg.contentMode = .scaleAspectFit
        profileImg.layer.masksToBounds = true
        
        
        changePhotoButton.frame = CGRect(x: 0.63 * screenWidth, y: 0.22 * screenHeight, width: 0.08 * screenWidth, height: 0.08 * screenWidth)
        changePhotoButton.setBackgroundImage(UIImage(named: "add_photo"), for: .normal)
        changePhotoButton.contentMode = .scaleAspectFit
        changePhotoButton.addTarget(self, action: #selector(selectPhoto), for: .touchUpInside)
        
        scrollview.addSubview(changePhotoButton)
        
        
        
        
        let downImg = UIImageView()
        downImg.image = UIImage(named: "down")
        downImg.frame = CGRect(x: 0.45 * screenWidth, y: 0.02 * screenHeight, width: 0.1 * screenWidth, height: 0.027 * screenHeight)
        view.addSubview(downImg)
        
        
        loginText.textAlignment = .left
        loginText.text = NSLocalizedString("Kaydını Oluştur", comment: "")
        loginText.textColor = lacivert
        loginText.font = UIFont(name: "Gilroy-Medium", size: 18 * stringMultiplier)
        loginText.frame = CGRect(x: 0.1 * screenWidth, y: 0.34 * screenHeight, width: 0.75 * screenWidth, height: 0.05 * screenHeight)
        scrollview.addSubview(loginText)
        
        
 
        nameTextField.makeCustomTextField(view: scrollview, yPozition: 0.4, isSecureText: false, placeholder: "Adınızı Giriniz")

        surnameTextField.makeCustomTextField(view: scrollview, yPozition: 0.47, isSecureText: false, placeholder: "Soyadınızı Giriniz")
     
        emailTextField.makeCustomTextField(view: scrollview, yPozition: 0.54, isSecureText: false, placeholder: "E-Posta Adresinizi Giriniz")
        
        passwordTextField.makeCustomTextField(view: scrollview, yPozition: 0.61, isSecureText: true, placeholder: "Şifrenizi Giriniz")

        passwordTextField2.makeCustomTextField(view: scrollview, yPozition: 0.68, isSecureText: true, placeholder: "Şifrenizi Doğrulayınız")
       
        
        
        let signUpButton = UIButton()
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.setTitle("Kayıt Ol", for: .normal)
        signUpButton.backgroundColor = yesil
        signUpButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.77 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        signUpButton.contentVerticalAlignment.self = .center
        signUpButton.layer.cornerRadius = 10
        signUpButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 18 * stringMultiplier)
        signUpButton.contentHorizontalAlignment.self = .center
        scrollview.addSubview(signUpButton)
        
        signUpButton.addTarget(self, action: #selector(kayitOlClicked), for: .touchUpInside)
        
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
                        
                        updateProfileItems()
                        
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
    
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    
    

    @objc func selectPhoto(){
        
        
        let alert = UIAlertController(title: "Fotoğraf Ekleyiniz", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Kamera", style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Galeri", style: .default, handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction.init(title: "İptal", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        profileImg.image = info[.editedImage] as? UIImage
        profileInfo.profilePhoto = profileImg.image!
        
        profileInfo.stringProfilePhoto = convertImageToBase64String(img: profileInfo.profilePhoto)
     
        
        
        
        self.dismiss(animated: true)
    }
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
            
        } else {
            let alert  = UIAlertController(title: "Hata", message: "Kameraya ulaşılamıyor.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Hata", message: "İzinleri kontrol ediniz.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    
    
    
}
