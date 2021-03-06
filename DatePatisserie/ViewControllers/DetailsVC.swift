//
//  DetailsVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 9.03.2022.
//

import UIKit
import Lottie

var animationView: AnimationView?

class DetailsVC: UIViewController {
    
 

    var selectedProduct = Product()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        createDetailUI()
    }

    func createDetailUI(){
        
        view.backgroundColor = .white

        let downImg = UIImageView()
        downImg.image = UIImage(named: "down")
        downImg.frame = CGRect(x: 0.45 * screenWidth, y: 0.02 * screenHeight, width: 0.1 * screenWidth, height: 0.02 * screenHeight)
        view.addSubview(downImg)
        downImg.contentMode = .scaleAspectFit
        
        let grayView = UIView()
        grayView.frame =  CGRect(x: 0, y: 0.48 * screenHeight, width: 1 * screenWidth, height: 0.5 * screenHeight)
        
        grayView.layer.cornerRadius = 24
        grayView.layer.masksToBounds = false
        grayView.layer.shadowColor = UIColor.lightGray.cgColor
        grayView.layer.shadowOffset = CGSize(width: 0, height: 0)
        grayView.layer.shadowOpacity = 0.5
        grayView.layer.shadowRadius = 20
        grayView.backgroundColor = gri
        view.addSubview(grayView)
        
        let mainTitle = UILabel()
        mainTitle.makeClassicLabel(x: 0.2, y: 0.063, w: 0.6, h: 0.04, text: "Detaylar", textColor: lacivert, textSize: 22, textAlignment: .center, addView: view)
        mainTitle.font = UIFont(name: "Gilroy-Bold", size: 22)

        let productImg = UIImageView()
        productImg.image = selectedProduct.image
        productImg.frame = CGRect(x: 0.14 * screenWidth, y: 0.132 * screenHeight, width: 0.72 * screenWidth, height: 0.26 * screenHeight)
        view.addSubview(productImg)
        productImg.contentMode = .scaleAspectFit
        

  
        let productName = UILabel()
        productName.text = selectedProduct.name
        productName.textAlignment = .left
        productName.textColor = lacivert
        productName.numberOfLines = 0
        productName.font = UIFont(name: "Gilroy-Bold", size: 20)
        productName.frame = CGRect(x: 0.075 * screenWidth, y: 0.4 * screenHeight, width: 0.85 * screenWidth, height: 0.15 * screenWidth)
        view.addSubview(productName)
        
        let kcal = UIImageView()
        kcal.frame = CGRect(x: 0.72 * screenWidth, y: 0.4 * screenHeight, width: 0.2 * screenWidth, height: 0.15 * screenWidth)
        kcal.image = UIImage(named: "kcal")
        view.addSubview(kcal)
        kcal.contentMode = .scaleAspectFit
        
        let kcalValue = UILabel()
        kcalValue.text = "\(selectedProduct.kcal)"
        kcalValue.textAlignment = .left
        kcalValue.textColor = lacivert
        kcalValue.numberOfLines = 0
        kcalValue.font = UIFont(name: "Gilroy-Regular", size: 16)
        kcalValue.frame = CGRect(x: 0.82 * screenWidth, y: 0.4 * screenHeight, width: 0.2 * screenWidth, height: 0.15 * screenWidth)
        view.addSubview(kcalValue)
        
        let productContentTitle = UILabel()
        productContentTitle.text = NSLocalizedString("İçindekiler", comment: "")
        productContentTitle.textAlignment = .left
        productContentTitle.textColor = lacivert
        productContentTitle.numberOfLines = 0
        productContentTitle.font = UIFont(name: "Gilroy-Bold", size: 20)
        productContentTitle.frame = CGRect(x: 0.075 * screenWidth, y: 0.51 * screenHeight, width: 0.85 * screenWidth, height: 0.04 * screenWidth)
        view.addSubview(productContentTitle)
        
        let productContentText = UILabel()
        productContentText.text = "\(selectedProduct.ingredients)"
        productContentText.textAlignment = .left
        productContentText.textColor = lacivert
        productContentText.layer.cornerRadius = 12
        productContentText.numberOfLines = 0
        productContentText.font = UIFont(name: "Gilroy-Regular", size: 16)
        productContentText.frame = CGRect(x: 0.075 * screenWidth, y: 0.55 * screenHeight, width: 0.85 * screenWidth, height: 0.06 * screenHeight)
        view.addSubview(productContentText)
        
        let detailTitle = UILabel()
        detailTitle.text = NSLocalizedString("Detaylar", comment: "")
        detailTitle.textAlignment = .left
        detailTitle.textColor = lacivert
        detailTitle.numberOfLines = 0
        detailTitle.font = UIFont(name: "Gilroy-Bold", size: 20)
        detailTitle.frame = CGRect(x: 0.075 * screenWidth, y: 0.63 * screenHeight, width: 0.85 * screenWidth, height: 0.04 * screenWidth)
        view.addSubview(detailTitle)
        
        let detail = UILabel()
        detail.text = selectedProduct.details
        detail.textAlignment = .left
        detail.textColor = lacivert
        detail.layer.cornerRadius = 12
        detail.numberOfLines = 0
        detail.font = UIFont(name: "Gilroy-Regular", size: 16)
        detail.frame = CGRect(x: 0.075 * screenWidth, y: 0.65 * screenHeight, width: 0.62 * screenWidth, height: 0.13 * screenHeight)
        view.addSubview(detail)
        
        let price = UILabel()
        price.text = "\(selectedProduct.price)"
        price.textAlignment = .center
        price.textColor = lacivert
        price.backgroundColor = .clear
        price.layer.cornerRadius = 18
        price.numberOfLines = 0
        price.font = UIFont(name: "Gilroy-Regular", size: 21)
        price.frame = CGRect(x: 0.73 * screenWidth, y: 0.685 * screenHeight, width: 0.14 * screenWidth, height: 0.1 * screenHeight)
        view.addSubview(price)
        
        
        let addCartButton = UIButton()
        addCartButton.setTitleColor(.white, for: .normal)
        addCartButton.setTitle("Sepete Ekle", for: .normal)
        addCartButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.815 * screenHeight, width: 0.8 * screenWidth, height: 0.06 * screenHeight)
        addCartButton.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 14 * stringMultiplier)
        addCartButton.layer.cornerRadius = 12
        addCartButton.backgroundColor = yesil
        addCartButton.layer.masksToBounds = false
        addCartButton.layer.shadowColor = UIColor.lightGray.cgColor
        addCartButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        addCartButton.layer.shadowOpacity = 0.5
        addCartButton.layer.shadowRadius = 12
        addCartButton.addPulseEffect()

        view.addSubview(addCartButton)
        addCartButton.addTarget(self, action: #selector(addCartButtonClicked), for: .touchUpInside)
        
        
    }
    
    @objc func addCartButtonClicked(){
        print("asasdasdas")
 
        
        let cartObject  = CartObject()
        cartObject.product = selectedProduct
        cartProducts.append(cartObject)
        
        let animationBackground = UIView(frame: view.frame)
        animationBackground.backgroundColor = UIColor(white: 0, alpha: 0.75)
        view.addSubview(animationBackground)
        
        animationView = .init(name: "added_cart")
        animationView?.center = view.center
        animationView?.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        animationView?.play()
        animationView?.loopMode = .loop
        animationBackground.addSubview(animationView!)
        
        let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
            
            animationView?.pause()
            animationView?.isHidden = true
            animationBackground.isHidden = true
            presentVC(currentVC: self, destinationVC: OrderVC(), toDirection: .down)
            
      }
   
    }
}
