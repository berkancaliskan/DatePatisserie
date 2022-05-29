//
//  HomeVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 10.04.2022.
//

import UIKit
import FirebaseFirestore
import Firebase
import FirebaseAuth
import Lottie

// QR okutuldukça artacak içilen kahveye göre işlemleri yapıp bilgiyi sağlıyor.
// Firebaseden gelecek değer


//İsmin altında yazıların değişmesi için sayaç
var textNumberCounter = 0
let infoText = UILabel()
let coffeeProgressImageView = UIImageView()


let foodImage1 = UIImageView()
let foodImage2 = UIImageView()
let foodImage3 = UIImageView()

let detailsFoodContentLabel = UILabel()

let dailyFoodNamesLabel = UILabel()



class HomeVC: UIViewController {
    
  
    var coffeeLottie: AnimationView?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        view.backgroundColor = .white
        setDefaultSize(view: view)
        createTopUI()
        setCoffeeProgress()
        createDailyMenuUI()
        changeText()
        
        
     
    }
    
   
    func changeText(){
        let _ = Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
            textNumberCounter += 1
            switch textNumberCounter % 5{
            case 0:
                infoText.text = "Profil sayfasından sana özel QR kodunu okutarak kahve kazanabilirsin!"
            case 1:
                infoText.text = "Gel-Al siparişi ver anında hediye kahveyi kap!"
            case 2:
                infoText.text = "Mayıs ayına özel tatlı ve kahve menüsü %30 indirimli."
            case 3:
                infoText.text = "Kendini lezzet dolu pizzalar ile ödüllendir!"
            case 4:
                infoText.text = "Dilediğinde öneri ve düşüncelerini ayarlardaki iletişim kısmından paylaşabilirsin."
            default:
                infoText.text = ""
            }
            
        }
        
    }
    func createTopUI(){
        
        let settingsButton = UIButton()
        settingsButton.setBackgroundImage(UIImage(named: "settings_btn"), for: UIControl.State.normal)
        settingsButton.frame = CGRect(x: 0.05 * screenWidth, y: 0.065 * screenHeight, width: 0.084 * screenWidth, height: 0.084 * screenWidth)
        view.addSubview(settingsButton)
        settingsButton.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        settingsButton.addTarget(self, action: #selector(settingsClicked), for: UIControl.Event.touchUpInside)
        
        let profileButton = UIButton()
        profileButton.setBackgroundImage(UIImage(named: "profile"), for: UIControl.State.normal)
        profileButton.frame = CGRect(x: 0.865 * screenWidth, y: 0.065 * screenHeight, width: 0.084 * screenWidth, height: 0.084 * screenWidth)
        view.addSubview(profileButton)
        profileButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        profileButton.addTarget(self, action: #selector(profileClicked), for: UIControl.Event.touchUpInside)
        
        let helloName = UILabel()
        helloName.text = NSLocalizedString("Merhaba, \(profileInfo.name) ", comment: "")
        helloName.textColor = lacivert
        helloName.textAlignment = .left
        helloName.numberOfLines = 0
        helloName.font = UIFont(name: "Gilroy-Bold", size: 21 * stringMultiplier)
        helloName.frame = CGRect(x: 0.05 * screenWidth, y: 0.125 * screenHeight, width: 0.7 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(helloName)
        
        
        infoText.text = "Profil sayfasından sana özel QR kodunu okutarak kahve kazanabilirsin!"
        infoText.textAlignment = .left
        infoText.textColor = lacivert
        infoText.numberOfLines = 0
        infoText.font = UIFont(name: "Gilroy-Regular", size: 18 * stringMultiplier)
        infoText.frame = CGRect(x: 0.05 * screenWidth, y: 0.17 * screenHeight, width: 0.9 * screenWidth, height: 0.1 * screenHeight)
        view.addSubview(infoText)
        
        
        
        let menuButton = UIButton()
        menuButton.backgroundColor = yesil
        menuButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        menuButton.setTitle("MENÜ", for: .normal)
        menuButton.layer.cornerRadius = 15
        menuButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        menuButton.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 19)
        menuButton.frame = CGRect(x: 0.05 * screenWidth, y: 0.45 * screenHeight, width: 0.9 * screenWidth, height: 0.086 * screenHeight)
        menuButton.layer.shadowColor = UIColor.lightGray.cgColor
        menuButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        menuButton.layer.shadowOpacity = 0.7
        menuButton.layer.shadowRadius = 12.0
        menuButton.layer.masksToBounds = false
        menuButton.addVibrateEffect()
        view.addSubview(menuButton)
        menuButton.addTarget(self, action: #selector(menuClicked), for: UIControl.Event.touchUpInside)
        
        
        
    }
    
    func setCoffeeProgress(){
        
        
        
        let icilenKahve = profileInfo.qrCounter % 10
        let kalankahve = 10 - profileInfo.qrCounter % 10

      
        let coffeeProgressBg = UIView()
        coffeeProgressBg.frame = CGRect(x: 0.05 * screenWidth, y: 0.27 * screenHeight, width: 0.9 * screenWidth, height: 0.156 * screenHeight)
        
        coffeeProgressBg.backgroundColor = gri
        coffeeProgressBg.layer.masksToBounds = true
        coffeeProgressBg.layer.cornerRadius = 18
        view.addSubview(coffeeProgressBg)
        
        coffeeLottie = .init(name: "coffee_lottie")
        coffeeLottie?.frame =  CGRect(x: 114, y: (0.284 * screenHeight) , width: 94, height: 94)
        coffeeLottie?.play()
        coffeeLottie?.loopMode = .loop
        view.addSubview(coffeeLottie!)
        coffeeLottie?.backgroundBehavior = .pauseAndRestore
        
        
        coffeeProgressImageView.frame = CGRect(x: 0.084 * screenWidth, y: 0.305 * screenHeight , width: 0.18 * screenWidth, height: 0.18 * screenWidth)
        
        coffeeProgressImageView.clipsToBounds = true
        coffeeProgressImageView.contentMode = .scaleAspectFill
        view.addSubview(coffeeProgressImageView)
        
      
        
        let coffeInfoText = UILabel()
        coffeInfoText.text = NSLocalizedString("Hediye kahvene son \n\(kalankahve) kahve kaldı! ", comment: "")
        coffeInfoText.textAlignment = .left
        coffeInfoText.textColor = lacivert
        coffeInfoText.numberOfLines = 0
        coffeInfoText.font = UIFont(name: "Gilroy-Regular", size: 17.3 * stringMultiplier)
        coffeInfoText.frame = CGRect(x: 0.5 * screenWidth, y: 0.284 * screenHeight , width: 170, height: 94)
        view.addSubview(coffeInfoText)
        
       
        switch icilenKahve {
            
        case 0:
            coffeeProgressImageView.image = UIImage(named: "p0")
        case 1:
            coffeeProgressImageView.image = UIImage(named: "p1")
        case 2:
            coffeeProgressImageView.image = UIImage(named: "p2")
        case 3:
            coffeeProgressImageView.image = UIImage(named: "p3")
        case 4:
            coffeeProgressImageView.image = UIImage(named: "p4")
        case 5:
            coffeeProgressImageView.image = UIImage(named: "p5")
        case 6:
            coffeeProgressImageView.image = UIImage(named: "p6")
        case 7:
            coffeeProgressImageView.image = UIImage(named: "p7")
        case 8:
            coffeeProgressImageView.image = UIImage(named: "p8")
        case 9:
            coffeeProgressImageView.image = UIImage(named: "p9")
        default:
            coffeeProgressImageView.image = UIImage(named: "p10")
            coffeInfoText.text = NSLocalizedString("Tebrikler Kahve Kazandınız!", comment: "")
        }
        
    }
    
    func createDailyMenuUI(){
        
        let dailyFoodBg = UIView()
        dailyFoodBg.frame = CGRect(x: 0, y: 0.56 * screenHeight, width: screenWidth, height: 0.5 * screenHeight)
        dailyFoodBg.backgroundColor = gri
        dailyFoodBg.layer.masksToBounds = true
        dailyFoodBg.layer.cornerRadius = 22
        view.addSubview(dailyFoodBg)
        
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        let dateString = df.string(from: date)
        
        let dateLabel = UILabel()
        dateLabel.text = NSLocalizedString("\(dateString)", comment: "")
        dateLabel.textAlignment = .left
        dateLabel.textColor = lacivert
        dateLabel.numberOfLines = 0
        dateLabel.font = UIFont(name: "Gilroy-Regular", size: 12.7 * stringMultiplier)
        dateLabel.frame = CGRect(x: 330, y: 10, width: 88, height: 33)
        dailyFoodBg.addSubview(dateLabel)
        
        
        let dailyFoodTitle = UILabel()
        dailyFoodTitle.text = NSLocalizedString("Günün Menüsü", comment: "")
        dailyFoodTitle.textAlignment = .left
        dailyFoodTitle.textColor = lacivert
        dailyFoodTitle.numberOfLines = 0
        dailyFoodTitle.font = UIFont(name: "Gilroy-Bold", size: 18 * stringMultiplier)
        dailyFoodTitle.frame = CGRect(x: 16, y: 10, width: 170, height: 33)
        dailyFoodBg.addSubview(dailyFoodTitle)
        
        
        
        let foodNamesTitle = UILabel()
        foodNamesTitle.text = NSLocalizedString("Yemekler", comment: "")
        foodNamesTitle.textAlignment = .left
        foodNamesTitle.textColor = lacivert
        foodNamesTitle.numberOfLines = 0
        foodNamesTitle.font = UIFont(name: "Gilroy-Bold", size: 18 * stringMultiplier)
        foodNamesTitle.frame = CGRect(x: 16, y: 170, width: 390, height: 32)
        dailyFoodBg.addSubview(foodNamesTitle)
        
        
        
        dailyFoodNamesLabel.text = "..."
        dailyFoodNamesLabel.textAlignment = .left
        dailyFoodNamesLabel.textColor = lacivert
        dailyFoodNamesLabel.numberOfLines = 0
        dailyFoodNamesLabel.font = UIFont(name: "Gilroy-Regular", size: 18 * stringMultiplier)
        dailyFoodNamesLabel.frame = CGRect(x: 16, y: 185, width: 390, height: 56)
        dailyFoodBg.addSubview(dailyFoodNamesLabel)
        
        
        
        let foodDetailsTitle = UILabel()
        foodDetailsTitle.text = NSLocalizedString("Detaylar ", comment: "")
        foodDetailsTitle.textAlignment = .left
        foodDetailsTitle.textColor = lacivert
        foodDetailsTitle.numberOfLines = 0
        foodDetailsTitle.font = UIFont(name: "Gilroy-Bold", size: 18 * stringMultiplier)
        foodDetailsTitle.frame = CGRect(x: 16, y: 230, width: 390, height: 32)
        dailyFoodBg.addSubview(foodDetailsTitle)
        
        
        
        
        detailsFoodContentLabel.text = NSLocalizedString("...", comment: "")
        detailsFoodContentLabel.textAlignment = .left
        detailsFoodContentLabel.textColor = lacivert
        detailsFoodContentLabel.numberOfLines = 0
        detailsFoodContentLabel.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
        detailsFoodContentLabel.frame = CGRect(x: 16, y: 245, width: 390, height: 56)
        dailyFoodBg.addSubview(detailsFoodContentLabel)
        
        
        
        
        
        foodImage1.frame = CGRect(x: 0.05 * screenWidth, y: 50, width: 0.28 * screenWidth, height: 0.28 * screenWidth)
        foodImage1.clipsToBounds = true
        foodImage1.backgroundColor = .white
        foodImage1.layer.cornerRadius = 16
        foodImage1.image = UIImage(named: "daily_loading")
        foodImage1.contentMode = .scaleAspectFit
        dailyFoodBg.addSubview(foodImage1)
        print(dailyFoodBg.frame.width)
        
        
        foodImage2.frame = CGRect(x: 0.5 * screenWidth - 0.14 * screenWidth, y: 50, width: 0.28 * screenWidth, height: 0.28 * screenWidth)
        foodImage2.clipsToBounds = true
        foodImage2.backgroundColor = .white
        foodImage2.layer.cornerRadius = 16
        foodImage2.image = UIImage(named: "daily_loading")
        foodImage2.contentMode = .scaleAspectFit
        dailyFoodBg.addSubview(foodImage2)
        
        
        foodImage3.frame = CGRect(x: 0.67 * screenWidth, y: 50, width: 0.28 * screenWidth, height: 0.28 * screenWidth)
        foodImage3.clipsToBounds = true
        foodImage3.backgroundColor = .white
        foodImage3.layer.cornerRadius = 16
        foodImage3.image = UIImage(named: "daily_loading")
        foodImage3.contentMode = .scaleAspectFit
        dailyFoodBg.addSubview(foodImage3)
        
    }
    
   
    
    
    @objc func menuClicked() {
        vibrate(style: .medium)
        presentVC(currentVC: self, destinationVC: MenuVC(), toDirection: .left)
        
    }
    
    @objc func settingsClicked() {
        
        vibrate(style: .medium)
        presentVC(currentVC: self, destinationVC: SettingsVC(), toDirection: .left)
    }
    @objc func profileClicked() {
        
        vibrate(style: .medium)
        presentVC(currentVC: self, destinationVC: ProfileVC(), toDirection: .right)
    }
    
    
}
