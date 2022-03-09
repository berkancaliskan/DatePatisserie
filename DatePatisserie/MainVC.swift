//
//  MainVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 22.01.2022.
//  koyuYesil

import UIKit
import Lottie

class MainVC: UIViewController {
    
    var foodLottie: AnimationView?
    var coffeeLottie: AnimationView?
    
    
    let progressView = UIProgressView(progressViewStyle: .bar)
    let maxKahve: Float = 10.0
    var icilenKahve: Float = 0.0
    var kahveSayisi = UILabel()
    var kalanKahveSayisi = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        progressGuncelle()
        
        let _ = Timer.scheduledTimer(withTimeInterval: 2.95, repeats: true) { timer in
            self.foodLottie?.isHidden = true
            self.coffeeLottie?.isHidden = false
    }
    
    func createUI(){
        
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        let stringMultiplier = 0.00115 * screenHeight
        view.backgroundColor = UIColor.white
        
        
        progressView.frame = CGRect(x: 0.2 * screenWidth, y: 0.45 * screenHeight, width: 0.6 * screenWidth, height: 0.1 * screenHeight)
        progressView.setProgress(icilenKahve, animated: true)
        progressView.trackTintColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        progressView.layer.cornerRadius = 4
        progressView.transform = CGAffineTransform(scaleX: 1, y: 4)
        progressView.tintColor = UIColor(red: 0.957, green: 0.784, blue: 0.596, alpha: 1)
        self.progressView.clipsToBounds = true
        view.addSubview(progressView)

        
        let mainTitle = UILabel()
        mainTitle.text = NSLocalizedString("Date Patisserie", comment: "")
        mainTitle.textAlignment = .center
        mainTitle.textColor = koyuYesil
        mainTitle.numberOfLines = 0
        mainTitle.font = UIFont(name: "Gilroy-Bold", size: 22 * stringMultiplier)
        mainTitle.frame = CGRect(x: 0.2 * screenWidth, y: 0.056 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(mainTitle)
        

        kahveSayisi.text = NSLocalizedString("", comment: "")
        kahveSayisi.textAlignment = .left
        kahveSayisi.textColor = koyuYesil
        kahveSayisi.numberOfLines = 0
        kahveSayisi.font = UIFont(name: "Gilroy-Bold", size: 19 * stringMultiplier)
        kahveSayisi.frame = CGRect(x: 0.2 * screenWidth, y: 0.5 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(kahveSayisi)
        
        
        kalanKahveSayisi.text = NSLocalizedString("", comment: "")
        kalanKahveSayisi.textAlignment = .left
        kalanKahveSayisi.textColor = .systemGreen
        kalanKahveSayisi.numberOfLines = 0
        kalanKahveSayisi.font = UIFont(name: "Gilroy-Regular", size: 18 * stringMultiplier)
        kalanKahveSayisi.frame = CGRect(x: 0.2 * screenWidth, y: 0.53 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(kalanKahveSayisi)
        

        let settingsButton = UIButton()
        settingsButton.setBackgroundImage(UIImage(named: "settings_btn"), for: UIControl.State.normal)
        settingsButton.frame = CGRect(x: 0.04 * screenWidth, y: 0.065 * screenHeight, width: 0.084 * screenWidth, height: 0.038 * screenHeight)
        settingsButton.contentVerticalAlignment.self = .center
        settingsButton.contentHorizontalAlignment.self = .center
                view.addSubview(settingsButton)
        settingsButton.addTarget(self, action: #selector(settingsClicked), for: UIControl.Event.touchUpInside)
        
        
        let profileButton = UIButton()
        profileButton.setBackgroundImage(UIImage(named: "profile"), for: UIControl.State.normal)
        profileButton.frame = CGRect(x: 0.84 * screenWidth, y: 0.065 * screenHeight, width: 0.084 * screenWidth, height: 0.038 * screenHeight)
        profileButton.contentVerticalAlignment.self = .center
        profileButton.contentHorizontalAlignment.self = .center
                view.addSubview(profileButton)
        profileButton.addTarget(self, action: #selector(profileClicked), for: UIControl.Event.touchUpInside)
    
        
        
        coffeeLottie = .init(name: "coffee_lottie")
        coffeeLottie?.frame =  CGRect(x: 0.24 * screenWidth, y: 0.13 * screenHeight, width: 0.52 * screenWidth, height: 0.325 * screenHeight)
            
        coffeeLottie?.play()
        coffeeLottie?.loopMode = .loop
        coffeeLottie?.isHidden = true
        self.view.addSubview(coffeeLottie!)
        coffeeLottie?.backgroundBehavior = .pauseAndRestore
  
        foodLottie = .init(name: "food_loading")
        foodLottie?.frame =  CGRect(x: 0.24 * screenWidth, y: 0.13 * screenHeight, width: 0.52 * screenWidth, height: 0.325 * screenHeight)
        foodLottie?.play()
        foodLottie?.loopMode = .loop
        view.addSubview(foodLottie!)
        
        
        
        let artıButton = UIButton()
        artıButton.setBackgroundImage(UIImage(named: "add"), for: UIControl.State.normal)
        artıButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        artıButton.frame = CGRect(x: 0.8 * screenWidth, y: 0.3 * screenHeight, width: 0.1 * screenWidth, height: 0.047 * screenHeight)
        view.addSubview(artıButton)
        artıButton.addTarget(self, action: #selector(kahveArtır), for: UIControl.Event.touchUpInside)
            
        
        
        let yemekMenuButton = UIButton()
        yemekMenuButton.setBackgroundImage(UIImage(named: "menubutton"), for: UIControl.State.normal)
        yemekMenuButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        yemekMenuButton.setTitle("Menü", for: .normal)
        yemekMenuButton.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 16)
        yemekMenuButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.66 * screenHeight, width: 0.8 * screenWidth, height: 0.077 * screenHeight)
        view.addSubview(yemekMenuButton)
        yemekMenuButton.addTarget(self, action: #selector(yemekClicked), for: UIControl.Event.touchUpInside)
        
        
        let menuButton2 = UIButton()
        menuButton2.setBackgroundImage(UIImage(named: "menubutton"), for: UIControl.State.normal)
        menuButton2.setTitleColor(UIColor.black, for: UIControl.State.normal)
        menuButton2.setTitle("Menü", for: .normal)
        menuButton2.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 16)
        menuButton2.frame = CGRect(x: 0.1 * screenWidth, y: 0.73 * screenHeight, width: 0.8 * screenWidth, height: 0.077 * screenHeight)
        view.addSubview(menuButton2)
        menuButton2.addTarget(self, action: #selector(yemekClicked), for: UIControl.Event.touchUpInside)
        
        
        let menuButton3 = UIButton()
        menuButton3.setBackgroundImage(UIImage(named: "menubutton"), for: UIControl.State.normal)
        menuButton3.setTitleColor(UIColor.black, for: UIControl.State.normal)
        menuButton3.setTitle("Menü", for: .normal)
        menuButton3.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 16)
        menuButton3.frame = CGRect(x: 0.1 * screenWidth, y: 0.8 * screenHeight, width: 0.8 * screenWidth, height: 0.077 * screenHeight)
        view.addSubview(        menuButton3)
        menuButton3.addTarget(self, action: #selector(yemekClicked), for: UIControl.Event.touchUpInside)
        

        
}
        
//        let text = UITextView()
//        text.text = "Date Atalier  & Patisserie & Eatery"
//        text.textColor = .black
//        text.frame = CGRect(x: 0.1 * screenWidth, y: 0.8 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
//        text.textAlignment = .center
//        text.font = UIFont(name: "Gilroy-Light", size:13)
//        text.backgroundColor = .clear
//        view.addSubview(text)

        
        
//        let gununYemegiButton = UIButton()
//        gununYemegiButton.setBackgroundImage(UIImage(named: "gununyemegi"), for: UIControl.State.normal)
//        gununYemegiButton.frame = CGRect(x: 0.08 * screenWidth, y: 0.66 * screenHeight, width: 0.42 * screenWidth, height: 0.22 * screenHeight)
//        view.addSubview(gununYemegiButton)
//        gununYemegiButton.addTarget(self, action: #selector(gununClicked), for: UIControl.Event.touchUpInside)

        let yemekMenuButton = UIButton()
        yemekMenuButton.setBackgroundImage(UIImage(named: "yemekmenu"), for: UIControl.State.normal)
        yemekMenuButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        yemekMenuButton.frame = CGRect(x: 0.5 * screenWidth, y: 0.46 * screenHeight, width: 0.42 * screenWidth, height: 0.22 * screenHeight)
        view.addSubview(yemekMenuButton)
        yemekMenuButton.addTarget(self, action: #selector(yemekClicked), for: UIControl.Event.touchUpInside)

//
//        let kahveButton = UIButton()
//        kahveButton.setBackgroundImage(UIImage(named: "kahve"), for: UIControl.State.normal)
//        kahveButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
//        kahveButton.frame = CGRect(x: 0.08 * screenWidth, y: 0.68 * screenHeight, width: 0.42 * screenWidth, height: 0.22 * screenHeight)
//        view.addSubview(kahveButton)
//        kahveButton.addTarget(self, action: #selector(kahveClicked), for: UIControl.Event.touchUpInside)
//
//
//        let tatliButton = UIButton()
//        tatliButton.setBackgroundImage(UIImage(named: "tatli"), for: UIControl.State.normal)
//        tatliButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
//        tatliButton.frame = CGRect(x: 0.5 * screenWidth, y: 0.68 * screenHeight, width: 0.42 * screenWidth, height: 0.22 * screenHeight)
//        view.addSubview(tatliButton)
//        tatliButton.addTarget(self, action: #selector(tatliClicked), for: UIControl.Event.touchUpInside)

        

}
    
    @objc func kahveArtır(){
        
        icilenKahve = icilenKahve + 1
        
        let barDegeri = icilenKahve / maxKahve

        if icilenKahve <= maxKahve {
                
            self.progressView.setProgress(barDegeri, animated: true)
                 kahveSayisi.text = "Kahve Sayınız: \(Int(barDegeri*10))"
            
            
            if Int(barDegeri*10) == 10{
                kahveSayisi.text = "Tebrikler Kahve Kazandınız."
                kahveSayisi.textColor = UIColor.systemGreen
               }
                
        }else{
                
            
            kahveSayisi.text = "Kahve Sayınız: \(Int(barDegeri*10)%10)"
            
            if (Int(barDegeri*10)%10) == 0{
                

            kahveSayisi.text = "Tebrikler Kahve Kazandınız."
    
            
                
            }
            kahveSayisi.textColor = koyuYesil
            
            }

            kalanKahveSayisi.text = "Kahve kazanmanıza: \(10-Int(barDegeri*10)%10)"
            
    }
    

    @objc func progressGuncelle() {
    
        let barDegeri = icilenKahve / maxKahve
       
        print(barDegeri)
        
        
        
        if icilenKahve < maxKahve {
            
            self.progressView.setProgress(barDegeri, animated: true)
            
            kahveSayisi.text = "Kahve Sayınız: \(Int(barDegeri*10))"
            kahveSayisi.textColor = koyuYesil
            
            
        }else{
            
            kahveSayisi.text = "Tebrikler Kahve Kazandınız."
            kahveSayisi.textColor = UIColor.systemGreen
        }
        
        kalanKahveSayisi.text = "Kahve kazanmanıza: \(Int(10-(barDegeri*10)))"
        kalanKahveSayisi.textColor = koyuYesil
        
            
}
    
    
    
    
    
    @objc func settingsClicked() {
        performSegue(withIdentifier: "mainToSet", sender: nil)
}
    @objc func profileClicked() {
        
        vibrate(style: .medium)
        performSegue(withIdentifier: "mainToProfile", sender: nil)
}
    
    @objc func tatliClicked() {
        performSegue(withIdentifier: "mainToMenu", sender: nil)
}
    
    @objc func yemekClicked() {
        
        performSegue(withIdentifier: "mainToMenu", sender: nil)

        
}
    
    @objc func kahveClicked() {
        
        performSegue(withIdentifier: "mainToMenu", sender: nil)
}
    @objc func gununClicked() {

            performSegue(withIdentifier: "mainToMenu", sender: nil)

}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    if segue.identifier == "mainToSet"{

        let destination = segue.destination as! SettingsVC
        destination.hero.isEnabled = true
        destination.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .right), dismissing: .slide(direction: .left))
        
      }else if segue.identifier == "mainToProfile"{
        let destination = segue.destination as! ProfileVC
        destination.hero.isEnabled = true
        destination.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .left), dismissing: .slide(direction: .right))
            
          }
   }
}

