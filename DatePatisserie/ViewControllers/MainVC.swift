////
////  MainVC.swift
////  DatePatisserie
////
////  Created by Berkan Çalışkan on 22.01.2022.
////  lacivert
//
//import UIKit
//import Lottie
//
//class MainVC: UIViewController {
//
//
//
//    let progressView = UIProgressView(progressViewStyle: .bar)
//    let maxKahve: Float = 10.0
//    var icilenKahve: Float = 0.0
//    var kahveSayisi = UILabel()
//    var kalanKahveSayisi = UILabel()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setDefaultSize(view: view)
//        createUI()
//        progressGuncelle()
//
//
//
//    func createUI(){
//
//        view.backgroundColor = UIColor.white
//
//
//        progressView.frame = CGRect(x: 0.2 * screenWidth, y: 0.45 * screenHeight, width: 0.6 * screenWidth, height: 0.1 * screenHeight)
//        progressView.setProgress(icilenKahve, animated: true)
//        progressView.trackTintColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
//        progressView.layer.cornerRadius = 4
//        progressView.transform = CGAffineTransform(scaleX: 1, y: 4)
//        progressView.tintColor = UIColor(red: 0.957, green: 0.784, blue: 0.596, alpha: 1)
//        self.progressView.clipsToBounds = true
//        view.addSubview(progressView)
//
//
//        let mainTitle = UILabel()
//        mainTitle.text = NSLocalizedString("Date Patisserie", comment: "")
//        mainTitle.textAlignment = .center
//        mainTitle.textColor = lacivert
//        mainTitle.numberOfLines = 0
//        mainTitle.font = UIFont(name: "Gilroy-Bold", size: 22 * stringMultiplier)
//        mainTitle.frame = CGRect(x: 0.2 * screenWidth, y: 0.056 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
//        view.addSubview(mainTitle)
//
//
//        kahveSayisi.text = NSLocalizedString("", comment: "")
//        kahveSayisi.textAlignment = .left
//        kahveSayisi.textColor = lacivert
//        kahveSayisi.numberOfLines = 0
//        kahveSayisi.font = UIFont(name: "Gilroy-Bold", size: 19 * stringMultiplier)
//        kahveSayisi.frame = CGRect(x: 0.2 * screenWidth, y: 0.5 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
//        view.addSubview(kahveSayisi)
//
//
//        kalanKahveSayisi.text = NSLocalizedString("", comment: "")
//        kalanKahveSayisi.textAlignment = .left
//        kalanKahveSayisi.textColor = .systemGreen
//        kalanKahveSayisi.numberOfLines = 0
//        kalanKahveSayisi.font = UIFont(name: "Gilroy-Regular", size: 18 * stringMultiplier)
//        kalanKahveSayisi.frame = CGRect(x: 0.2 * screenWidth, y: 0.53 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
//        view.addSubview(kalanKahveSayisi)
//
//
//
//
//
//
//        let artıButton = UIButton()
//        artıButton.setBackgroundImage(UIImage(named: "add"), for: UIControl.State.normal)
//        artıButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
//        artıButton.frame = CGRect(x: 0.8 * screenWidth, y: 0.3 * screenHeight, width: 0.1 * screenWidth, height: 0.047 * screenHeight)
//        view.addSubview(artıButton)
//        artıButton.addTarget(self, action: #selector(kahveArtır), for: UIControl.Event.touchUpInside)
//
//
//
//        let yemekMenuButton = UIButton()
//        yemekMenuButton.setBackgroundImage(UIImage(named: "menubutton"), for: UIControl.State.normal)
//        yemekMenuButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
//        yemekMenuButton.setTitle("Menü", for: .normal)
//        yemekMenuButton.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 16)
//        yemekMenuButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.66 * screenHeight, width: 0.8 * screenWidth, height: 0.077 * screenHeight)
//        view.addSubview(yemekMenuButton)
//        yemekMenuButton.addTarget(self, action: #selector(yemekClicked), for: UIControl.Event.touchUpInside)
//
//
//        let menuButton2 = UIButton()
//        menuButton2.setBackgroundImage(UIImage(named: "menubutton"), for: UIControl.State.normal)
//        menuButton2.setTitleColor(UIColor.black, for: UIControl.State.normal)
//        menuButton2.setTitle("Menü", for: .normal)
//        menuButton2.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 16)
//        menuButton2.frame = CGRect(x: 0.1 * screenWidth, y: 0.73 * screenHeight, width: 0.8 * screenWidth, height: 0.077 * screenHeight)
//        view.addSubview(menuButton2)
//        menuButton2.addTarget(self, action: #selector(yemekClicked), for: UIControl.Event.touchUpInside)
//
//
//        let menuButton3 = UIButton()
//        menuButton3.setBackgroundImage(UIImage(named: "menubutton"), for: UIControl.State.normal)
//        menuButton3.setTitleColor(UIColor.black, for: UIControl.State.normal)
//        menuButton3.setTitle("Menü", for: .normal)
//        menuButton3.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 16)
//        menuButton3.frame = CGRect(x: 0.1 * screenWidth, y: 0.8 * screenHeight, width: 0.8 * screenWidth, height: 0.077 * screenHeight)
//        view.addSubview(        menuButton3)
//        menuButton3.addTarget(self, action: #selector(yemekClicked), for: UIControl.Event.touchUpInside)
//
//
//
//}
//
//
//
//}
//
//    @objc func kahveArtır(){
//
//        icilenKahve = icilenKahve + 1
//
//        let barDegeri = icilenKahve / maxKahve
//
//        if icilenKahve <= maxKahve {
//
//            self.progressView.setProgress(barDegeri, animated: true)
//                 kahveSayisi.text = "Kahve Sayınız: \(Int(barDegeri*10))"
//
//
//            if Int(barDegeri*10) == 10{
//                kahveSayisi.text = "Tebrikler Kahve Kazandınız."
//                kahveSayisi.textColor = UIColor.systemGreen
//               }
//
//        }else{
//
//
//            kahveSayisi.text = "Kahve Sayınız: \(Int(barDegeri*10)%10)"
//
//            if (Int(barDegeri*10)%10) == 0{
//
//
//            kahveSayisi.text = "Tebrikler Kahve Kazandınız."
//
//
//
//            }
//            kahveSayisi.textColor = lacivert
//
//            }
//
//            kalanKahveSayisi.text = "Kahve kazanmanıza: \(10-Int(barDegeri*10)%10)"
//
//    }
//
//
//    @objc func progressGuncelle() {
//
//        let barDegeri = icilenKahve / maxKahve
//
//        print(barDegeri)
//
//
//
//        if icilenKahve < maxKahve {
//
//            self.progressView.setProgress(barDegeri, animated: true)
//
//            kahveSayisi.text = "Kahve Sayınız: \(Int(barDegeri*10))"
//            kahveSayisi.textColor = lacivert
//
//
//        }else{
//
//            kahveSayisi.text = "Tebrikler Kahve Kazandınız."
//            kahveSayisi.textColor = UIColor.systemGreen
//        }
//
//        kalanKahveSayisi.text = "Kahve kazanmanıza: \(Int(10-(barDegeri*10)))"
//        kalanKahveSayisi.textColor = lacivert
//
//
//}
//
//
//
//
//
//
//    @objc func tatliClicked() {
//
//        presentVC(currentVC: self, destinationVC: self, toDirection: .left)
//}
//
//    @objc func yemekClicked() {
//
//        performSegue(withIdentifier: "mainToMenu", sender: nil)
//
//
//}
//
//    @objc func kahveClicked() {
//
//        performSegue(withIdentifier: "mainToMenu", sender: nil)
//}
//    @objc func gununClicked() {
//
//            performSegue(withIdentifier: "mainToMenu", sender: nil)
//
//}
//
//}
//
