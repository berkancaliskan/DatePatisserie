
//LottieVC.swift
//DatePatisserie

//Created by Berkan Çalışkan on 29.01.2022.


import UIKit
import Lottie

class StartVC: UIViewController {
    
    var animationView: AnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefaultSize(view: view)
        createUI()
        setTimer()
        
    }
    private func createUI(){
        
        view.backgroundColor = UIColor.white
        
        let appInfo = UITextView()
        appInfo.text = "Date Atalier  & Patisserie & Eatery"
        appInfo.textColor = .black
        appInfo.frame = CGRect(x: 0.1 * screenWidth, y: 0.8 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
        appInfo.textAlignment = .center
        appInfo.font = UIFont(name: "Gilroy-Light", size:13)
        appInfo.backgroundColor = .clear
        view.addSubview(appInfo)
        
        animationView = .init(name: "hamburger_loading")
        animationView?.center = view.center
        animationView?.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        animationView?.play()
        animationView?.loopMode = .loop
        view.addSubview(animationView!)
        
    }
    
    private func setTimer(){
        
        let _ = Timer.scheduledTimer(withTimeInterval: 3.9, repeats: false) { timer in
            self.animationView?.stop()
            self.animationView?.isHidden = true
            presentVCWithoutAnimation(currentVC: self, destinationVC: HomeVC()) }
        }
}

