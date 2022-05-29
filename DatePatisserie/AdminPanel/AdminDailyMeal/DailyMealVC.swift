//
//  DailyMealVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 19.05.2022.
//

import UIKit
import Hero
import Firebase
let saveButton  = UIButton()

class DailyMealVC: UIViewController, UIScrollViewDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let scrollview = UIScrollView()
    
    var firstMeal = UIImageView()
    var secondMeal = UIImageView()
    var thirdMeal = UIImageView()
    
    let mealDetailTextView = UITextView()
    let mealNamesTextField  = UITextField()
    
    var whichButton = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        createScrollView()
        createUI()
        
        
        print("skdfnşksdfnm")
        print(convertImageToBase64String(img: firstMeal.image!))
       
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    func createScrollView(){
        
        scrollview.frame = CGRect(x: 0, y: 0.12 * screenHeight , width: screenWidth, height: screenHeight)
        scrollview.contentSize = CGSize(width: screenWidth , height: screenHeight * 1.25)
        scrollview.alwaysBounceVertical = true
        scrollview.delegate = self
        scrollview.backgroundColor = .clear
        view.addSubview(scrollview)
        
    }
    func createUI(){
        
        view.backgroundColor = .white
        
        let backButton = UIButton()
        backButton.setBackgroundImage(UIImage(named: "back_btn"), for: UIControl.State.normal)
        backButton.frame = CGRect(x: 0.054 * screenWidth, y: 0.07 * screenHeight, width: 0.08 * screenWidth, height: 0.08 * screenWidth)
        backButton.contentVerticalAlignment.self = .center
        backButton.contentHorizontalAlignment.self = .center
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backClicked), for: UIControl.Event.touchUpInside)
        
        let title = UILabel()
        title.frame = CGRect(x: 0.2 * screenWidth, y: 0.057 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
        title.text = "Yemek Seçimi"
        title.textAlignment = .center
        title.font = UIFont(name: "Gilroy-Bold", size: 22)
        title.textColor = lacivert
        view.addSubview(title)
        
        
        firstMeal.image = UIImage(named: "first_meal")
        firstMeal.frame = CGRect(x: 0.05 * screenWidth, y: 0.1 * screenHeight, width: 0.27 * screenWidth, height: 0.27 * screenWidth)
        firstMeal.contentMode = .scaleAspectFill
        firstMeal.layer.masksToBounds = true
        firstMeal.layer.cornerRadius = 12
        firstMeal.layer.borderColor = UIColor.lightGray.cgColor
        firstMeal.layer.borderWidth = 1
        scrollview.addSubview(firstMeal)
        
        
        secondMeal.image = UIImage(named: "second_meal")
        secondMeal.frame = CGRect(x: view.frame.midX - 0.135 * screenWidth, y: 0.1 * screenHeight, width: 0.27 * screenWidth, height: 0.27 * screenWidth)
        secondMeal.contentMode = .scaleAspectFill
        secondMeal.layer.masksToBounds = true
        secondMeal.layer.cornerRadius = 12
        secondMeal.layer.borderColor = UIColor.lightGray.cgColor
        secondMeal.layer.borderWidth = 1
        scrollview.addSubview(secondMeal)
        
        
        thirdMeal.image = UIImage(named: "third_meal")
        thirdMeal.frame = CGRect(x: 0.68 * screenWidth, y: 0.1 * screenHeight, width: 0.27 * screenWidth, height: 0.27 * screenWidth)
        thirdMeal.contentMode = .scaleAspectFill
        thirdMeal.layer.masksToBounds = true
        thirdMeal.layer.cornerRadius = 12
        thirdMeal.layer.borderColor = UIColor.lightGray.cgColor
        thirdMeal.layer.borderWidth = 1
        scrollview.addSubview(thirdMeal)
        
        
        let firstMealButton = UIButton()
        firstMealButton.backgroundColor = lacivert
        firstMealButton.frame = CGRect(x: 0.05 * screenWidth, y: 0.26 * screenHeight, width: 0.27 * screenWidth, height: 0.06 * screenWidth)
        firstMealButton.layer.cornerRadius = 6
        firstMealButton.setTitle("Fotoğraf Ekle", for: .normal)
        firstMealButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 12)
        scrollview.addSubview(firstMealButton)
        firstMealButton.addTarget(self, action: #selector(firstclicked), for: UIControl.Event.touchUpInside)
        
        
        let secondMealButton = UIButton()
        secondMealButton.backgroundColor = lacivert
        secondMealButton.frame = CGRect(x: view.frame.midX - 0.135 * screenWidth, y: 0.26 * screenHeight, width: 0.27 * screenWidth, height: 0.06 * screenWidth)
        secondMealButton.layer.cornerRadius = 6
        secondMealButton.setTitle("Fotoğraf Ekle", for: .normal)
        secondMealButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 12)
        scrollview.addSubview(secondMealButton)
        secondMealButton.addTarget(self, action: #selector(secondclicked), for: UIControl.Event.touchUpInside)
        
        
        let thirdMealButton = UIButton()
        thirdMealButton.backgroundColor = lacivert
        thirdMealButton.frame = CGRect(x: 0.68 * screenWidth, y: 0.26 * screenHeight, width: 0.27 * screenWidth, height: 0.06 * screenWidth)
        thirdMealButton.layer.cornerRadius = 6
        thirdMealButton.setTitle("Fotoğraf Ekle", for: .normal)
        thirdMealButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 12)
        scrollview.addSubview(thirdMealButton)
        thirdMealButton.addTarget(self, action: #selector(thirdclicked), for: UIControl.Event.touchUpInside)
        
        let mealNametitle = UILabel()
        mealNametitle.frame = CGRect(x: 0.05 * screenWidth, y: 0.35 * screenHeight, width: 098 * screenWidth, height: 0.03 * screenHeight)
        mealNametitle.text = "Yemek İsimleri"
        mealNametitle.textAlignment = .left
        mealNametitle.font = UIFont(name: "Gilroy-Bold", size: 12)
        mealNametitle.textColor = lacivert
        scrollview.addSubview(mealNametitle)
        
        mealNamesTextField.makeCustomTextField(view: scrollview, yPozition: 0.38, isSecureText: false, placeholder: "")
        mealNamesTextField.frame = CGRect(x: 0.05 * screenWidth, y: 0.38 * screenHeight, width: 0.9 * screenWidth, height: 0.06 * screenHeight)
        mealNamesTextField.layer.cornerRadius = 8
        
        
        let mealInfoTitle = UILabel()
        mealInfoTitle.frame = CGRect(x: 0.05 * screenWidth, y: 0.46 * screenHeight, width: 0.9 * screenWidth, height: 0.03 * screenHeight)
        mealInfoTitle.text = "Yemek Detayları"
        mealInfoTitle.textAlignment = .left
        mealInfoTitle.font = UIFont(name: "Gilroy-Bold", size: 12)
        mealInfoTitle.textColor = lacivert
        scrollview.addSubview(mealInfoTitle)
        
        
        mealDetailTextView.frame = CGRect(x: 0.05 * screenWidth, y: 0.49 * screenHeight, width: 0.9 * screenWidth, height: 0.06 * screenHeight)
        mealDetailTextView.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
        mealDetailTextView.textColor = lacivert
        mealDetailTextView.returnKeyType = UIReturnKeyType.done
        mealDetailTextView.layer.cornerRadius = 8
        mealDetailTextView.layer.borderWidth = 1
        mealDetailTextView.layer.borderColor = lacivert.cgColor
        mealDetailTextView.backgroundColor = .clear
        mealDetailTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 15, right: 15)
        mealDetailTextView.layer.masksToBounds = true
        scrollview.addSubview(mealDetailTextView)
        
        

        saveButton.setTitleColor(.white, for: .normal)
        saveButton.setTitle("Seçilen Yemekleri Kaydet", for: .normal)
        saveButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.66 * screenHeight, width: 0.8 * screenWidth, height: 0.076 * screenHeight)
        saveButton.layer.cornerRadius = 12
        saveButton.backgroundColor = yesil
        saveButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 18)
        scrollview.addSubview(saveButton)
        saveButton.addTarget(self, action: #selector(saveBtnClicked(sender:)), for: .touchUpInside)
        
    }
    
    
    func dailyMealItemUpdate(){
        
        dailyMeal.mealNames = mealNamesTextField.text!
        dailyMeal.mealDetail = mealDetailTextView.text!
        dailyMeal.firstMeal = firstMeal.image!
        dailyMeal.secondMeal = secondMeal.image!
        dailyMeal.thirdMeal = thirdMeal.image!
        
    }
    
    
    
    
    @objc func backClicked() {
        
        presentVC(currentVC: self, destinationVC: AdminMainVC(), toDirection: .right)
        
    }
    
   
    @objc func firstclicked(){
        whichButton = "first"
        selectPhoto()
    }
    
    @objc func secondclicked(){
        
        whichButton = "second"
        selectPhoto()
    }
    
    @objc func thirdclicked(){
        whichButton = "third"
        selectPhoto()
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    @objc func saveBtnClicked(sender: UIButton){
        
        dailyMealItemUpdate()
     
        
        
        if  mealDetailTextView.text != "" && mealNamesTextField.text != "" {
            
        
            let date = Date()
            let df = DateFormatter()
            df.dateFormat = "dd-MM-yyyy"
            let dateString = df.string(from: date)
            
           
           let str_first_meal = convertImageToBase64String(img: firstMeal.image!)
           let str_second_meal = convertImageToBase64String(img: secondMeal.image!)
           let str_third_meal = convertImageToBase64String(img: thirdMeal.image!)
           
            
            let db = Firestore.firestore()
            db.collection("DailyMeal").document("\(dateString)").setData([
                "firstMealPhoto" : str_first_meal,
                "secondMealPhoto" : str_second_meal,
                "thirdMealPhoto" : str_third_meal,
                "mealNames" : "\(dailyMeal.mealNames)",
                "mealDetails" : "\(dailyMeal.mealDetail)",

            ])
           showCustomAlert(title: "İşlem Başarılı", message: "Günlük yemek girişiniz tamamlandı.", viewController: self)
       }else{
           
           showCustomAlert(title: "İşlem Başarısız", message: "Lütfen tekrar deneyiniz.", viewController: self)
       }
        
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
        
        switch whichButton {
        case "first":
            firstMeal.image = info[.editedImage] as? UIImage
        case "second":
            secondMeal.image = info[.editedImage] as? UIImage
        case "third":
            thirdMeal.image = info[.editedImage] as? UIImage
        default:
            print("imagepicker_error")
        }
        
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

