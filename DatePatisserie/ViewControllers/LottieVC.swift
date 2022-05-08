
//LottieVC.swift
//DatePatisserie

//Created by Berkan Çalışkan on 29.01.2022.


import UIKit
import Lottie

class LottieVC: UIViewController {

    var animationView: AnimationView?

    override func viewDidLoad() {
//        view.backgroundColor = UIColor.white
        super.viewDidLoad()

        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width


        animationView = .init(name: "hamburger_loading")
        animationView?.frame =  CGRect(x: 0.24 * screenWidth, y: 0.3 * screenHeight, width: 0.52 * screenWidth, height: 0.325 * screenHeight)
        
        animationView?.play()
        animationView?.loopMode = .loop

        view.addSubview(animationView!)
        
        let appInfo = UITextView()
        appInfo.text = "Date Atalier  & Patisserie & Eatery"
        appInfo.textColor = .black
        appInfo.frame = CGRect(x: 0.1 * screenWidth, y: 0.8 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
        appInfo.textAlignment = .center
        appInfo.font = UIFont(name: "Gilroy-Light", size:13)
        appInfo.backgroundColor = .clear
        view.addSubview(appInfo)

        
        let _ = Timer.scheduledTimer(withTimeInterval: 3.9, repeats: true) { timer in
            
        presentVCWithoutAnimation(currentVC: self, destinationVC: MainVC()) }
             

    }


    
    
}
