//
//  Onboarding2VC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 22.01.2022.
//

import UIKit

class Onboarding2VC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        let stringMultiplier = 0.00115 * screenHeight
        
        let pagePointer = UIImageView()
        pagePointer.image = UIImage(named: "slider2")
        pagePointer.frame = CGRect(x: 0.36 * screenWidth, y: 0.8 * screenHeight, width: 0.28 * screenWidth, height: 0.005 * screenHeight)
        view.addSubview(pagePointer)

        let onboadingImg = UIImageView()
        onboadingImg.image = UIImage(named: "on_img2")
        onboadingImg.frame = CGRect(x: 0.05 * screenWidth, y: 0.22 * screenHeight, width: 0.9 * screenWidth, height: 0.5 * screenHeight)
        view.addSubview(onboadingImg)
        
        
        let holderTitle = UILabel()
        holderTitle.text = NSLocalizedString("Onboarding 2 Title ", comment:"")
        holderTitle.textAlignment = .center
        holderTitle.textColor = UIColor(red: 1.00, green: 0.32, blue: 0.00, alpha: 1.00)
        holderTitle.font = UIFont(name: "Gilroy-Bold", size: 22 * stringMultiplier)
        holderTitle.numberOfLines = 0
        holderTitle.frame = CGRect(x: 0.1 * screenWidth, y: 0.52 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
        view.addSubview(holderTitle)
        
        
        let holderSubTit = UILabel()
        holderSubTit.text = NSLocalizedString("Your browsing history and site data doesn’t saved.", comment:"")
        holderSubTit.textAlignment = .center
        holderSubTit.textColor = .black
        holderSubTit.numberOfLines = 0
        holderSubTit.font = UIFont(name: "Gilroy-Regular", size: 20 * stringMultiplier)
        holderSubTit.frame = CGRect(x: 0.1 * screenWidth, y: 0.56 * screenHeight, width: 0.8 * screenWidth, height: 0.18 * screenHeight)
        view.addSubview(holderSubTit)
        
        
        let button = UIButton()
        button.setTitle(NSLocalizedString("Devam Et", comment: ""), for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.setBackgroundImage(UIImage(named: "btn_start" ), for: UIControl.State.normal)
        button.frame = CGRect(x: 0.06763285024154589 * screenWidth, y: 0.88 * screenHeight, width: 0.8695652173913043 * screenWidth, height: 0.06584821428571429 * screenHeight)
        button.contentVerticalAlignment.self = .center
        button.contentHorizontalAlignment.self = .center
        button.titleLabel?.font = UIFont(name: "Gilroy-Bold", size: 22 * stringMultiplier)
        view.addSubview(button)
        button.addTarget(self, action: #selector(starButtonClicked), for: UIControl.Event.touchUpInside)

    }
    
    @objc func starButtonClicked() {
        
        vibrate(style: .heavy)
        performSegue(withIdentifier: "onboarding2to3", sender: nil)
    
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    if segue.identifier == "onboarding2to3"{

        let destination = segue.destination as! Onboarding3VC
        destination.hero.isEnabled = true
        destination.hero.modalAnimationType = .selectBy(presenting: .slide(direction: .left), dismissing: .slide(direction: .right))
        

        }
    }
}
