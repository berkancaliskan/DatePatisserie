//
//  DetailsVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 9.03.2022.
//

import UIKit

class DetailsVC: UIViewController {
    
    let mainTitle = UILabel()
    let detailTitle = UILabel()
    let mainImg = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        

        createDetailUI()
    }
    func createDetailUI(){
        
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        mainTitle.text = NSLocalizedString("Detaylar", comment: "")
        mainTitle.textAlignment = .center
        mainTitle.textColor = UIColor.green
        mainTitle.numberOfLines = 0
        mainTitle.font = UIFont(name: "Gilroy-Bold", size: 22)
        mainTitle.frame = CGRect(x: 0.2 * screenWidth, y: 0.06 * screenHeight, width: 0.6 * screenWidth, height: 0.08 * screenHeight)
        view.addSubview(mainTitle)
        
       
        mainImg.image = UIImage(named: "logo_original")
        mainImg.frame = CGRect(x: 0.17 * screenWidth, y: 0.14 * screenHeight, width: 0.66 * screenWidth, height: 0.3 * screenHeight)
        view.addSubview(mainImg)
        
        detailTitle.text = NSLocalizedString("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", comment: "")
        detailTitle.textAlignment = .left
        detailTitle.textColor = UIColor.darkGray
        detailTitle.numberOfLines = 0
        detailTitle.font = UIFont(name: "Gilroy-Bold", size: 16)
        detailTitle.frame = CGRect(x: 0.075 * screenWidth, y: 0.45 * screenHeight, width: 0.85 * screenWidth, height: 0.4 * screenHeight)
        view.addSubview(detailTitle)
        
        
    }
}
