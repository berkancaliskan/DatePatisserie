//
//  HomeVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 10.04.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        setDefaultSize(view: view)
        createTopUI()
   
    }
    
    func createTopUI(){
        
        
        let helloName = UILabel()
        helloName.text = NSLocalizedString("Merhaba, Berkan\(profileInfo.name) ", comment: "")
        
        helloName.textColor = lacivert
        helloName.textAlignment = .left
        helloName.numberOfLines = 0
        helloName.font = UIFont(name: "Gilroy-Bold", size: 20 * stringMultiplier)
        helloName.frame = CGRect(x: 0.24 * screenWidth, y: 0.1 * screenHeight, width: 0.7 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(helloName)
        
        let mainTitle = UILabel()
        mainTitle.text = NSLocalizedString("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tincidunt quis elit a molestie. Fusce aliquam nunc odio, vel eleifend tortor consectetur id. Curabitur ut cursus orci, ut sagittis massa. ", comment: "")
        mainTitle.textAlignment = .left
        mainTitle.textColor = koyuYesil
        mainTitle.numberOfLines = 0
        mainTitle.font = UIFont(name: "Gilroy-Light", size: 15 * stringMultiplier)
        mainTitle.frame = CGRect(x: 0.24 * screenWidth, y: 0.14 * screenHeight, width: 0.7 * screenWidth, height: 0.1 * screenHeight)
        view.addSubview(mainTitle)
        
        
        
        let yemekMenuButton = UIButton()
        yemekMenuButton.backgroundColor = acikYesil
        yemekMenuButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        yemekMenuButton.setTitle("Menü", for: .normal)
        yemekMenuButton.layer.cornerRadius = 10
        yemekMenuButton.contentEdgeInsets = UIEdgeInsets(top: 76, left: 0, bottom: 2, right: 0)
        yemekMenuButton.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 16)
        yemekMenuButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.27 * screenHeight, width: 0.35 * screenWidth, height: 0.37 * screenWidth)
        view.addSubview(yemekMenuButton)
        yemekMenuButton.addTarget(self, action: #selector(yemekClicked), for: UIControl.Event.touchUpInside)
        
        
        let kahveButton = UIButton()
        kahveButton.backgroundColor = acikYesil
        kahveButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        kahveButton.setTitle("Menü", for: .normal)
        kahveButton.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 16)
        kahveButton.layer.cornerRadius = 10
        kahveButton.titleEdgeInsets = UIEdgeInsets(top: 76, left: 0, bottom: 2, right: 0)
        kahveButton.frame = CGRect(x: 0.55 * screenWidth, y: 0.27 * screenHeight, width: 0.35 * screenWidth, height: 0.37 * screenWidth)
        view.addSubview(kahveButton)
        kahveButton.addTarget(self, action: #selector(kahveClicked), for: UIControl.Event.touchUpInside)
        
        
        
    }
    func createDailyMenuUI(){
        
        
    }
    
    
    @objc func yemekClicked() {
        
        presentVC(currentVC: self, destinationVC: FoodMenuVC(), toDirection: .left)
     
}
    
    @objc func kahveClicked() {
        
        presentVC(currentVC: self, destinationVC: CoffeeVC(), toDirection: .right)
}
  
    
}
