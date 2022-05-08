//
//  QRCodeVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 17.04.2022.
//

import UIKit

class QRCodeVC: UIViewController {
    
    let textField = UITextField()
    let QRImg = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setDefaultSize(view: view)
        createQrUI()
    }
    
    
    func createQrUI(){
        
        
        view.backgroundColor = UIColor.white
        
        let backButton = UIButton()
        backButton.setBackgroundImage(UIImage(named: "back_btn"), for: UIControl.State.normal)
        backButton.frame = CGRect(x: 0.04 * screenWidth, y: 0.07 * screenHeight, width: 0.06 * screenWidth, height: 0.024 * screenHeight)
        backButton.contentVerticalAlignment.self = .center
        backButton.contentHorizontalAlignment.self = .center
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backClicked), for: UIControl.Event.touchUpInside)
        
        let holderTitle = UILabel()
        holderTitle.text = NSLocalizedString("QR Kodunuz", comment:"")
        holderTitle.textAlignment = .center
        holderTitle.textColor = lacivert
        holderTitle.font = UIFont(name: "Gilroy-Bold", size: 22 * stringMultiplier)
        holderTitle.numberOfLines = 0
        holderTitle.frame = CGRect(x: 0.1 * screenWidth, y: 0.09 * screenHeight, width: 0.8 * screenWidth, height: 0.1 * screenHeight)
        view.addSubview(holderTitle)
        
        let holderSubTit = UILabel()
        holderSubTit.text = NSLocalizedString("Kahve aldığında sana özel qr kodunu okut hediye kahveye bir adım daha yaklaş!", comment:"")
        holderSubTit.textAlignment = .center
        holderSubTit.textColor = lacivert
        holderSubTit.numberOfLines = 0
        holderSubTit.font = UIFont(name: "Gilroy-Light", size: 16 * stringMultiplier)
        holderSubTit.frame = CGRect(x: 0.07 * screenWidth, y: 0.13 * screenHeight, width: 0.86 * screenWidth, height: 0.18 * screenHeight)
        view.addSubview(holderSubTit)
      
        QRImg.image = generateQRCode(from: "berkancaliskan.com")
        QRImg.frame = CGRect(x: (screenWidth - 0.3 * screenHeight)/2 ,
                                    y: 0.35 * screenHeight,
                                    width: 0.3 * screenHeight,
                                    height: 0.3 * screenHeight)
        view.addSubview(QRImg)
        QRImg.contentMode = .scaleAspectFit


    }
    

    
    @objc func backClicked(){
        
        dismiss(animated: true)
    }
    
    func generateQRCode(from string:String) -> UIImage? {
        
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator"){
            
            filter.setValue(data, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
            
        }
        
        return nil
        
    }
}
