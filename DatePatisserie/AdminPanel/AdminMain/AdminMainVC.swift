//
//  AdminMainVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 16.05.2022.
//

import UIKit

class AdminMainVC: UIViewController{
    
    
    let scrollview = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        createUI()
        
    }
    
 
    
    func createUI(){
        view.backgroundColor = .white
        
        let logo = UIImageView()
        logo.image = UIImage(named: "logo_original")
        logo.frame = CGRect(x: 0.25 * screenWidth, y: 0.18 * screenHeight, width: 0.5 * screenWidth, height: 0.5 * screenWidth)
        view.addSubview(logo)
        logo.contentMode = .scaleAspectFit
        
        let title = UILabel()
        title.text = NSLocalizedString("Yönetici Modu", comment: "")
        title.textAlignment = .center
        title.textColor = lacivert
        title.numberOfLines = 0
        title.font = UIFont(name: "Gilroy-Bold", size: 24)
        title.frame = CGRect(x: 0.2 * screenWidth, y: 0.06 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(title)
        
        let exitButton  = UIButton()
        exitButton.setBackgroundImage(UIImage(named: "exit"), for: .normal)
        exitButton.frame = CGRect(x: 0.85 * screenWidth, y: 0.066 * screenHeight, width: 0.05 * screenWidth, height: 0.05 * screenWidth)
        view.addSubview(exitButton)
        exitButton.addTarget(self, action: #selector(exitClicked), for: .touchUpInside)
        
        
        let orderButton  = UIButton()
        orderButton.setTitleColor(.white, for: .normal)
        orderButton.setTitle("Siparişleri Görüntüle", for: .normal)
        orderButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.55 * screenHeight, width: 0.8 * screenWidth, height: 0.08 * screenHeight)
        orderButton.layer.cornerRadius = 12
        orderButton.backgroundColor = yesil
        orderButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 18)
        view.addSubview(orderButton)
        orderButton.addTarget(self, action: #selector(toOrderClicked), for: .touchUpInside)
        
        
        let toDailyMealButton  = UIButton()
        toDailyMealButton.setTitleColor(.white, for: .normal)
        toDailyMealButton.setTitle("Günlük Yemek Gir", for: .normal)
        toDailyMealButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.65 * screenHeight, width: 0.8 * screenWidth, height: 0.08 * screenHeight)
        toDailyMealButton.layer.cornerRadius = 12
        toDailyMealButton.backgroundColor = yesil
        toDailyMealButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 18)
        view.addSubview(toDailyMealButton)
        toDailyMealButton.addTarget(self, action: #selector(toDailyClicked), for: .touchUpInside)
        
        let QRPageButton  = UIButton()
        QRPageButton.setTitleColor(.white, for: .normal)
        QRPageButton.setTitle("QR Sayfasına Git", for: .normal)
        QRPageButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.75 * screenHeight, width: 0.8 * screenWidth, height: 0.08 * screenHeight)
        QRPageButton.layer.cornerRadius = 12
        QRPageButton.backgroundColor = yesil
        QRPageButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 18)
        view.addSubview(QRPageButton)
        QRPageButton.addTarget(self, action: #selector(toQRClicked), for: .touchUpInside)
        
    }
    
    
    @objc func toOrderClicked() {
        presentVC(currentVC: self, destinationVC: AdminOrderVC(), toDirection: .right)
    }
    @objc func toDailyClicked() {
        presentVC(currentVC: self, destinationVC: DailyMealVC(), toDirection: .right)
    }
    
    @objc func toQRClicked() {
        presentVC(currentVC: self, destinationVC: AdminQRScanner(), toDirection: .right)
    }
    @objc func exitClicked(){
        
        let exitAlert = UIAlertController(title: "Çıkış",
                                             message: "Yönetici modundan çıkış yapmak istediğinize emin misiniz?",
                                             preferredStyle: UIAlertController.Style.alert)
        exitAlert.addAction(UIAlertAction(title: "Çıkış Yap",
                                             style: .default,
                                             handler: { (action: UIAlertAction!) in
            
            presentVC(currentVC: self, destinationVC: LoginVC(), toDirection: .down)
            
        }))
        
        exitAlert.addAction(UIAlertAction(title: "İptal",
                                             style: .default,
                                             handler: { (action: UIAlertAction!) in
                print("cancel clicked - close alert")
        }))
        
        self.present(exitAlert, animated: true, completion: nil)
        
    }
    
}
