//
//  QRCodeVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 17.04.2022.
//

import UIKit
import Firebase
import FirebaseAuth


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
        
        let downImg = UIImageView()
        downImg.image = UIImage(named: "down")
        downImg.frame = CGRect(x: 0.45 * screenWidth, y: 0.02 * screenHeight, width: 0.1 * screenWidth, height: 0.027 * screenHeight)
        view.addSubview(downImg)
        
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
        
        let qrUserId = UILabel()
        qrUserId.text = NSLocalizedString("\(Auth.auth().currentUser?.uid ?? "")", comment:"")
        qrUserId.textAlignment = .center
        qrUserId.textColor = lacivert
        qrUserId.numberOfLines = 0
        qrUserId.font = UIFont(name: "Gilroy-Light", size: 16 * stringMultiplier)
        qrUserId.frame = CGRect(x: 0.07 * screenWidth, y: 0.18 * screenHeight, width: 0.86 * screenWidth, height: 0.18 * screenHeight)
        view.addSubview(qrUserId)
        
        
        
      
        QRImg.image = generateQRCode(from: "\(Auth.auth().currentUser?.uid ?? "")")
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
