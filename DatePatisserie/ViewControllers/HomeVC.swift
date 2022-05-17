//
//  HomeVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 10.04.2022.
//

import UIKit
import Firebase
import FirebaseAuth
import Lottie

// QR okutuldukça artacak
var qrCounter = 34

var icilenKahve = qrCounter % 10
var kalankahve = 10 - qrCounter % 10


//İsmin altında yazıların değişmesi için sayaç
let infoText = UILabel()
var textNumberCounter = 0


let coffeeProgressImageView = UIImageView()

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
        helloName.text = NSLocalizedString("Merhaba, Berkan\(profileInfo.name) ", comment: "")
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
        
    
        let coffeeProgressBg = UIView()
        coffeeProgressBg.frame = CGRect(x: 0.05 * screenWidth, y: 0.27 * screenHeight, width: 0.9 * screenWidth, height: 0.156 * screenHeight)
        
        coffeeProgressBg.backgroundColor = gri
        coffeeProgressBg.layer.masksToBounds = true
        coffeeProgressBg.layer.cornerRadius = 18
        view.addSubview(coffeeProgressBg)
        
        coffeeLottie = .init(name: "coffee_lottie")
        coffeeLottie?.frame =  CGRect(x: 114, y: 25, width: 94, height: 94)
        coffeeLottie?.play()
        coffeeLottie?.loopMode = .loop
        coffeeProgressBg.addSubview(coffeeLottie!)
        coffeeLottie?.backgroundBehavior = .pauseAndRestore
        

        coffeeProgressImageView.frame = CGRect(x: 20, y: 22, width: 106, height: 106)
        coffeeProgressImageView.clipsToBounds = true
        coffeeProgressImageView.contentMode = .scaleAspectFill
        coffeeProgressBg.addSubview(coffeeProgressImageView)
        
        let coffeInfoText = UILabel()
        coffeInfoText.text = NSLocalizedString("Hediye kahvene son \n\(kalankahve) kahve kaldı! ", comment: "")
        coffeInfoText.textAlignment = .left
        coffeInfoText.textColor = lacivert
        coffeInfoText.numberOfLines = 0
        coffeInfoText.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
        coffeInfoText.frame = CGRect(x: 200, y: 25, width: 170, height: 94)
        coffeeProgressBg.addSubview(coffeInfoText)
        
        
        switch icilenKahve {
    
        case 0:
            coffeInfoText.text = NSLocalizedString("Tebrikler Kahve Kazandınız!", comment: "")
            coffeeProgressImageView.image = UIImage(named: "p10")
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
        dateLabel.frame = CGRect(x: 16, y: 44, width: 170, height: 33)
        dailyFoodBg.addSubview(dateLabel)
        
        
        let dailyFoodTitle = UILabel()
        dailyFoodTitle.text = NSLocalizedString("Günün Menüsü", comment: "")
        dailyFoodTitle.textAlignment = .left
        dailyFoodTitle.textColor = lacivert
        dailyFoodTitle.numberOfLines = 0
        dailyFoodTitle.font = UIFont(name: "Gilroy-Bold", size: 18 * stringMultiplier)
        dailyFoodTitle.frame = CGRect(x: 16, y: 20, width: 170, height: 33)
        dailyFoodBg.addSubview(dailyFoodTitle)
        
        let detailsTitle = UILabel()
        detailsTitle.text = NSLocalizedString("Detaylar ", comment: "")
        detailsTitle.textAlignment = .left
        detailsTitle.textColor = lacivert
        detailsTitle.numberOfLines = 0
        detailsTitle.font = UIFont(name: "Gilroy-Bold", size: 18 * stringMultiplier)
        detailsTitle.frame = CGRect(x: 16, y: 216, width: 390, height: 32)
        dailyFoodBg.addSubview(detailsTitle)
        

        let detailsContent = UILabel()
        detailsContent.text = NSLocalizedString("Dağ Kekikli Makarna, Mevsim Salatası, Domates Çorbası ", comment: "")
        detailsContent.textAlignment = .left
        detailsContent.textColor = lacivert
        detailsContent.numberOfLines = 0
        detailsContent.font = UIFont(name: "Gilroy-Regular", size: 16 * stringMultiplier)
        detailsContent.frame = CGRect(x: 16, y: 240, width: 390, height: 56)
        dailyFoodBg.addSubview(detailsContent)
        
        let foodImage1 = UIImageView()
        foodImage1.frame = CGRect(x: 16, y: 86, width: 120, height: 120)
        foodImage1.clipsToBounds = true
        foodImage1.backgroundColor = .white
        foodImage1.layer.cornerRadius = 16
        foodImage1.image = UIImage(named: "sandvic_1")
        foodImage1.contentMode = .scaleAspectFit
        dailyFoodBg.addSubview(foodImage1)
        
        print(dailyFoodBg.frame.width)
        
        let foodImage2 = UIImageView()
        foodImage2.frame = CGRect(x: 154, y: 86, width: 120, height: 120)
        foodImage2.clipsToBounds = true
        foodImage2.backgroundColor = .white
        foodImage2.layer.cornerRadius = 16
        foodImage2.image = UIImage(named: "sandvic_2")
        foodImage2.contentMode = .scaleAspectFill
        dailyFoodBg.addSubview(foodImage2)
        
        let foodImage3 = UIImageView()
        foodImage3.frame = CGRect(x: 292, y: 86, width: 120, height: 120)
        foodImage3.clipsToBounds = true
        foodImage3.backgroundColor = .white
        foodImage3.layer.cornerRadius = 16
        foodImage3.image = UIImage(named: "p3")
        foodImage3.contentMode = .scaleAspectFill
        dailyFoodBg.addSubview(foodImage3)
        
        
        
    }
    
    
    @objc func menuClicked() {
        
        presentVC(currentVC: self, destinationVC: MenuVC(), toDirection: .left)
     
}
    
    @objc func kahveClicked() {
        
        presentVC(currentVC: self, destinationVC: CoffeeVC(), toDirection: .right)
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
