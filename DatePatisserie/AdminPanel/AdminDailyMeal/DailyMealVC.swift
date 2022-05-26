//
//  DailyMealVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 19.05.2022.
//

import UIKit
import Hero
import Firebase

class DailyMealVC: UIViewController {
    
    var firstMeal = UIImageView()
    var secondMeal = UIImageView()
    var thirdMeal = UIImageView()
    
    let mealDetailTextField = UITextField()
    let mealNamesTextField  = UITextField()
    
    private weak var imageView: UIImageView!
    private lazy var imagePicker: ImagePicker = {
        let imagePicker = ImagePicker()
        imagePicker.delegate = self
        return imagePicker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        setDefaultSize(view: view)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    func createUI(){
        
        let backButton = UIButton()
        backButton.setBackgroundImage(UIImage(named: "back_btn"), for: UIControl.State.normal)
        backButton.frame = CGRect(x: 0.054 * screenWidth, y: 0.07 * screenHeight, width: 0.08 * screenWidth, height: 0.08 * screenWidth)
        backButton.contentVerticalAlignment.self = .center
        backButton.contentHorizontalAlignment.self = .center
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backClicked), for: UIControl.Event.touchUpInside)
        
        
        
        firstMeal.image = UIImage(named: "default_profile")
        firstMeal.frame = CGRect(x: 0.33 * screenWidth, y: 0.12 * screenHeight, width: 0.34 * screenWidth, height: 0.34 * screenWidth)
        firstMeal.contentMode = .scaleAspectFill
        
        firstMeal.layer.masksToBounds = true
        firstMeal.layer.cornerRadius = 12
        view.addSubview(firstMeal)
        
        
        secondMeal.image = UIImage(named: "default_profile")
        secondMeal.frame = CGRect(x: 0.33 * screenWidth, y: 0.12 * screenHeight, width: 0.34 * screenWidth, height: 0.34 * screenWidth)
        secondMeal.contentMode = .scaleAspectFill
        secondMeal.layer.masksToBounds = true
        secondMeal.layer.cornerRadius = 12
        view.addSubview(secondMeal)
        
        
        thirdMeal.image = UIImage(named: "default_profile")
        thirdMeal.frame = CGRect(x: 0.33 * screenWidth, y: 0.12 * screenHeight, width: 0.34 * screenWidth, height: 0.34 * screenWidth)
        thirdMeal.contentMode = .scaleAspectFill
        thirdMeal.layer.masksToBounds = true
        thirdMeal.layer.cornerRadius = 12
        view.addSubview(thirdMeal)
        
        
        
        let profilePhotoButton = UIButton()
        profilePhotoButton.backgroundColor = .green
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "edit"), for: .normal)
        profilePhotoButton.frame = CGRect(x: 0.57 * screenWidth, y: 0.25 * screenHeight, width: 0.1 * screenWidth, height: 0.1 * screenWidth)
        profilePhotoButton.contentVerticalAlignment.self = .center
        profilePhotoButton.contentHorizontalAlignment.self = .center
        view.addSubview(profilePhotoButton)
        profilePhotoButton.addTarget(self, action: #selector(selectPhoto), for: UIControl.Event.touchUpInside)
        
        
        
        
        mealDetailTextField.attributedPlaceholder = NSAttributedString(
            string: "Yemek Detayları",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        mealDetailTextField.frame = CGRect(x: 0.1 * screenWidth, y: 0.4 * screenHeight, width: 0.8 * screenWidth, height: 0.076 * screenHeight)
        mealDetailTextField.font = UIFont(name: "Gilroy-Regular", size: 16)
        mealDetailTextField.textColor = UIColor.black
        mealDetailTextField.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.95, alpha: 1.00)
        mealDetailTextField.layer.cornerRadius = 8
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: mealDetailTextField.frame.height))
        mealDetailTextField.leftView = paddingView
        mealDetailTextField.leftViewMode = UITextField.ViewMode.always
        self.view.addSubview(mealDetailTextField)
        
        

        mealNamesTextField.attributedPlaceholder = NSAttributedString(
            string: "Soyadınız",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        mealNamesTextField.frame = CGRect(x: 0.1 * screenWidth, y: 0.5 * screenHeight, width: 0.8 * screenWidth, height: 0.076 * screenHeight)
        mealNamesTextField.font = UIFont(name: "Gilroy-Regular", size: 16)
        mealNamesTextField.textColor = UIColor.black
        mealNamesTextField.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.95, alpha: 1.00)
        mealNamesTextField.layer.cornerRadius = 8
        mealNamesTextField.layer.masksToBounds = false
        
        let paddingView3 = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: mealNamesTextField.frame.height))
        mealNamesTextField.leftView = paddingView3
        mealNamesTextField.leftViewMode = UITextField.ViewMode.always
        self.view.addSubview(mealNamesTextField)
        
        
        let saveButton  = UIButton()
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.setTitle("Seçilen Yemekleri Kaydet", for: .normal)
        saveButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.6 * screenHeight, width: 0.8 * screenWidth, height: 0.076 * screenHeight)
        saveButton.layer.cornerRadius = 12
        saveButton.backgroundColor = yesil
        saveButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 18)
        view.addSubview(saveButton)
        saveButton.addTarget(self, action: #selector(saveClicked), for: .touchUpInside)
        
        
    }
    
    
    func dailyMealItemUpdate(){
        
        dailyMeal.mealNames = mealNamesTextField.text!
        dailyMeal.mealDetail = mealDetailTextField.text!
        
        dailyMeal.firstMeal = firstMeal.image!
        dailyMeal.secondMeal = secondMeal.image!
        dailyMeal.thirdMeal = thirdMeal.image!
        
        
        
    }
    
    
    @objc func selectPhoto(){
        
        imagePicker.photoGalleryAsscessRequest()
        
    }
    
    @objc func backClicked() {
        
        presentVC(currentVC: self, destinationVC: AdminMainVC(), toDirection: .right)
        
    }
    
    @objc func saveClicked() {
        
        dailyMealItemUpdate()
        
        
        if mealDetailTextField.text != "" && mealDetailTextField.text != "" {
            
            showCustomAlert(title: "Başarılı", message: "Kayıt işlemi gerçekleşti", viewController: self)
            
            
        }else{
            
            showCustomAlert(title: "OOPPPPSS✋🏻...", message: "Yemek isimleri ve detaylarını eksiksiz yazdığına emin ol ;)", viewController: self)
        }
        
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}

extension DailyMealVC: ImagePickerDelegate {
    
    func imagePicker(_ imagePicker: ImagePicker, didSelect image: UIImage) {
        
        firstMeal.image = image
        firstMeal.layer.borderWidth = 1.0
        firstMeal.layer.borderColor = UIColor.white.cgColor
        imagePicker.dismiss()
    }
    
    func cancelButtonDidClick(on imageView: ImagePicker) { imagePicker.dismiss() }
    func imagePicker(_ imagePicker: ImagePicker, grantedAccess: Bool,
                     to sourceType: UIImagePickerController.SourceType) {
        guard grantedAccess else { return }
        imagePicker.present(parent: self, sourceType: sourceType)
    }
}

