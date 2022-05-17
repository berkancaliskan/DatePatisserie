//
//  AdminMainVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 16.05.2022.
//

import UIKit

class AdminMainVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        createUI()
        
    }
    
    
    func createUI(){
        view.backgroundColor = .white
        
        let title = UILabel()
        title.makeClassicLabel(x: 0.2, y: 0.057, w: 0.6, h: 0.05, text: "Admin Panel", textColor: lacivert, textSize: 22, textAlignment: .center, addView: view)
        
        let incomingOrderTitle = UILabel()
        incomingOrderTitle.makeClassicLabel(x: 0.05, y: 0.12, w: 0.5, h: 0.05, text: "Gelen Siparişler", textColor: lacivert, textSize: 18, textAlignment: .left, addView: view)
        
        let incomingOrderLabel = UILabel()
        incomingOrderLabel.numberOfLines = 0
        incomingOrderLabel.makeClassicLabel(x: 0.05, y: 0.15, w: 0.9, h: 0.7, text: "Gelen sipariş: \nİsim soyisim \nUUID \nbildirim için token \nsaat dakika \nsipariş içeriği \ntoplam tutar ", textColor: lacivert, textSize: 18, textAlignment: .left, addView: view)
        
        let approveButton = UIButton()
        approveButton.setTitle("Onayla", for: .normal)
        approveButton.setTitleColor(.white, for: .normal)
        approveButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 18)
        approveButton.frame = CGRect(x: 0.07 * screenWidth, y: 0.76 * screenHeight, width: 0.86 * screenWidth, height: 0.08 * screenHeight)
        approveButton.backgroundColor = yesil
        approveButton.layer.cornerRadius = 14
        view.addSubview(approveButton)
        
        let rejectButton = UIButton()
        rejectButton.setTitle("Reddet", for: .normal)
        rejectButton.setTitleColor(.white, for: .normal)
        rejectButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 18)
        rejectButton.frame = CGRect(x: 0.07 * screenWidth, y: 0.85 * screenHeight, width: 0.86 * screenWidth, height: 0.08 * screenHeight)
        rejectButton.backgroundColor = lacivert
        rejectButton.layer.cornerRadius = 14
        view.addSubview(rejectButton)

    }
    
}
