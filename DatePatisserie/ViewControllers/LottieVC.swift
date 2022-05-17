
//LottieVC.swift
//DatePatisserie

//Created by Berkan Çalışkan on 29.01.2022.


import UIKit
import Lottie

class LottieVC: UIViewController {



    override func viewDidLoad() {
//        view.backgroundColor = UIColor.white
        super.viewDidLoad()

        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width


        
        let appInfo = UITextView()
        appInfo.text = "Date Atalier  & Patisserie & Eatery"
        appInfo.textColor = .black
        appInfo.frame = CGRect(x: 0.1 * screenWidth, y: 0.8 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
        appInfo.textAlignment = .center
        appInfo.font = UIFont(name: "Gilroy-Light", size:13)
        appInfo.backgroundColor = .clear
        view.addSubview(appInfo)

        
        let _ = Timer.scheduledTimer(withTimeInterval: 3.9, repeats: false) { timer in
            
        presentVCWithoutAnimation(currentVC: self, destinationVC: HomeVC()) }
             

    }


    
    
}
