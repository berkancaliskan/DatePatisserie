//
//  SuggestedUserCell.swift
//  TiktokAnalytics
//
//  Created by Berkan Çalışkan on 12.05.2022.
//

import UIKit

class OrderCell: UITableViewCell {

    static var cell = "cell"
    
    let price = 24.50
    
    var productImageView = UIImageView()
    var productName = UILabel()
    var productPrice = UILabel()
    var productTrashButton = UIButton()
    var productCounter = UIStepper()
    var productCounterLabel = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setDefaultSize(view: contentView)
        addSubview()
        configureImageViews()
        setConstraits()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    required init?(coder: NSCoder) { // Override init ile birlikte required init, program çökmesine karşı otomatik oluşturuldu.
        fatalError("init(coder:) fatal error has not been implemented")
    }
    
    func addSubview(){
        contentView.addSubview(productImageView)
        contentView.addSubview(productName)
        contentView.addSubview(productPrice)
        contentView.addSubview(productTrashButton)
        contentView.addSubview(productCounter)
        contentView.addSubview(productCounterLabel)
        productTrashButton.contentMode = .scaleAspectFit
      
    }
    
    func configureImageViews(){ // ImageView özellikleri configure metodunda oluşturuldu.
    
        productImageView.clipsToBounds = true
        productImageView.image = UIImage(named: "sandvic_2")
        productImageView.layer.borderWidth = 2
        productImageView.layer.borderColor = UIColor.white.cgColor
        productImageView.layer.cornerRadius = 12
        productImageView.contentMode = .scaleAspectFill
    
        productTrashButton.backgroundColor = .clear
        productTrashButton.setBackgroundImage(UIImage(systemName: "trash"), for: UIControl.State.normal)
        productTrashButton.isHidden = true
        
        productName.numberOfLines = 0
        productName.textColor = lacivert
        productName.textAlignment = .left
        productName.font = UIFont(name: "Gilroy-Bold", size: 340 * stringMultiplier)
        
        productPrice.numberOfLines = 0

        let doubleStr = String(format: "%.2f", price) // "3.14"
        productPrice.textColor = lacivert
        productPrice.textAlignment = .left
        productPrice.font = UIFont(name: "Gilroy-Regular", size: 280 * stringMultiplier)
        
        productCounter.value = 1
        productCounterLabel.text = String(Int(productCounter.value))
        productCounterLabel.textColor = lacivert
        productCounterLabel.textAlignment = .center
        productCounterLabel.font = UIFont(name: "Gilroy-Regular", size: 320 * stringMultiplier)

        
        productCounter.layer.cornerRadius = 8
        productCounter.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        productCounter.maximumValue = 10
        productCounter.minimumValue = 1
// UIStepper değerini eş zamanlı olarak hareket etmesini istiyorsak true olmalı.
        productCounter.isContinuous = true

// Düğmeye basılı tutarsanız, UIStepper değeri sürekli olarak artar.
        productCounter.autorepeat = true
        productCounter.backgroundColor = UIColor.clear
        productCounter.stepValue = 1
       
    
    
    }
    
 
    
    func setConstraits(){
        
        productImageView.frame    = CGRect(x: 15, y: 15, width: 60,  height: 60)
        productName.frame         = CGRect(x: 90, y: 18, width: 280, height: 25)
        productPrice.frame        = CGRect(x: 90, y: 43, width: 280, height: 25)
//        productTrashButton.frame  = CGRect(x: 340, y: 35, width: 18, height: 18)
        productCounter.frame      = CGRect(x: 300, y: 35, width: 8, height: 5)
        productCounterLabel.frame = CGRect(x: 260, y: 35, width: 23, height: 23)
    }
    
}
    
    
    
    
