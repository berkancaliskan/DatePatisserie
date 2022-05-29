//
//  Onboarding3VC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 22.01.2022.
//

import UIKit

class Onboarding3VC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setDefaultSize(view: view)

        createUI()
        
    }
    func createUI(){
        
        let pagePointer = UIImageView()
        pagePointer.image = UIImage(named: "slider3")
        pagePointer.frame = CGRect(x:      0.450  * screenWidth,
                                   y:      0.930  * screenHeight,
                                   width:  0.100  * screenWidth,
                                   height: 0.005  * screenHeight)
        
        view.addSubview(pagePointer)

        let onboadingImg = UIImageView()
        onboadingImg.image = UIImage(named: "on_img3")
        onboadingImg.frame = CGRect(x: (screenWidth - 0.3 * screenHeight)/2 ,
                                    y: 0.35 * screenHeight,
                                    width: 0.3 * screenHeight,
                                    height: 0.3 * screenHeight)
        view.addSubview(onboadingImg)
        onboadingImg.contentMode = .scaleAspectFit
        
        let holderTitle = UILabel()
        holderTitle.text = NSLocalizedString("Tüm Menü Elinin Altında!", comment:"")
        holderTitle.textAlignment = .center
        holderTitle.textColor = lacivert
        holderTitle.font = UIFont(name: "Gilroy-Bold", size: 22 * stringMultiplier)
        holderTitle.numberOfLines = 0
        holderTitle.frame = CGRect(x: 0.1 * screenWidth, y: 0.06 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
        view.addSubview(holderTitle)
        
        let holderSubTit = UILabel()
        holderSubTit.text = NSLocalizedString("Size özel hazırlanmış menüye anında ulaş ve sipariş ver.", comment:"")
        holderSubTit.textAlignment = .center
        holderSubTit.textColor = lacivert
        holderSubTit.numberOfLines = 0
        holderSubTit.font = UIFont(name: "Gilroy-Light", size: 18 * stringMultiplier)
        holderSubTit.frame = CGRect(x: 0.1 * screenWidth, y: 0.1 * screenHeight, width: 0.8 * screenWidth, height: 0.18 * screenHeight)
        view.addSubview(holderSubTit)
        
        let button = UIButton()

        button.setBackgroundImage(UIImage(named: "btn_devam_et" ), for: UIControl.State.normal)
        button.frame = CGRect(x: 0.274 * screenWidth, y: 0.78 * screenHeight, width: 0.452 * screenWidth, height: 0.15 * screenWidth)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonClicked), for: UIControl.Event.touchUpInside)


    }

    @objc func buttonClicked() {
        uDefaults.setValue("user", forKey: "user")
        vibrate(style: .heavy)
        presentVC(currentVC: self, destinationVC: LoginVC(), toDirection: .right)
    
}

    }
