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
        
        setDefaultSize(view: view)

        createUI()
        
    }
    
    func createUI(){
        
        let pagePointer = UIImageView()
        pagePointer.image = UIImage(named: "slider2")
        pagePointer.frame = CGRect(x:      0.450  * screenWidth,
                                   y:      0.930  * screenHeight,
                                   width:  0.100  * screenWidth,
                                   height: 0.005  * screenHeight)
        
        view.addSubview(pagePointer)

        let onboadingImg = UIImageView()
        onboadingImg.image = UIImage(named: "on_img2")
        onboadingImg.frame = CGRect(x: (screenWidth - 0.3 * screenHeight)/2 ,
                                    y: 0.35 * screenHeight,
                                    width: 0.3 * screenHeight,
                                    height: 0.3 * screenHeight)
        onboadingImg.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        view.addSubview(onboadingImg)
        onboadingImg.contentMode = .scaleAspectFit
        
        let holderTitle = UILabel()
        holderTitle.text = NSLocalizedString("Anında Haberdar Ol!", comment:"")
        holderTitle.textAlignment = .center
        holderTitle.textColor = lacivert
        holderTitle.font = UIFont(name: "Gilroy-Bold", size: 22 * stringMultiplier)
        holderTitle.numberOfLines = 0
        holderTitle.frame = CGRect(x: 0.1 * screenWidth, y: 0.06 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
        view.addSubview(holderTitle)
        
        let holderSubTit = UILabel()
        holderSubTit.text = NSLocalizedString("Anasayfanda günlük yemek menüsüne ulaş dilediğini sipariş ver.", comment:"")
        holderSubTit.textAlignment = .center
        holderSubTit.textColor = lacivert
        holderSubTit.numberOfLines = 0
        holderSubTit.font = UIFont(name: "Gilroy-Light", size: 18 * stringMultiplier)
        holderSubTit.frame = CGRect(x: 0.15 * screenWidth, y: 0.08 * screenHeight, width: 0.7 * screenWidth, height: 0.18 * screenHeight)
        view.addSubview(holderSubTit)
        
        let button = UIButton()

        button.setBackgroundImage(UIImage(named: "btn_devam_et" ), for: UIControl.State.normal)
        button.frame = CGRect(x: 0.274 * screenWidth, y: 0.78 * screenHeight, width: 0.452 * screenWidth, height: 0.15 * screenWidth)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonClicked), for: UIControl.Event.touchUpInside)


    }

    @objc func buttonClicked() {
        vibrate(style: .heavy)
        presentVC(currentVC: self, destinationVC: Onboarding3VC(), toDirection: .right)
    
}

    }
