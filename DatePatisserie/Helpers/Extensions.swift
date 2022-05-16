//
//  Extensions.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 28.03.2022.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hexCode: String) {
        let hex = hexCode.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}


extension UIButton{
    
    
    func makeCircleMenuButton(title : String, icon: UIImage){
        
        
        self.backgroundColor = krem
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = self.frame.width * 0.5
        self.titleLabel?.text = title
        self.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 12 * stringMultiplier)
        self.contentHorizontalAlignment.self = .center
        
        let imageW = self.frame.width * 0.6
        let iconW = self.frame.width
        let iconView = UIImageView()
        iconView.image = icon
        iconView.frame = CGRect(x: (iconW - imageW) * 0.5 , y: 12, width: imageW , height: imageW)
        self.addSubview(iconView)
        iconView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        
        let iconNameLabel = UILabel()
        iconNameLabel.frame = CGRect(x: 0, y: self.frame.midY + 15, width: self.frame.width , height: self.frame.height * 0.1)
        iconNameLabel.font = UIFont(name: "Gilroy-Medium", size: 12 * stringMultiplier)
        iconNameLabel.textColor = lacivert
        iconNameLabel.text = title
        iconNameLabel.textAlignment = .center
        self.addSubview(iconNameLabel)
    }
    
    func activeButton(){
        
        self.layer.borderColor = yesil.cgColor
        self.layer.borderWidth = 4
        
    }
    
    func deactiveButton(){
        
        self.layer.borderWidth = 0
        
    }
    
    func addPulseEffect(){
        
        let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            
            UIButton.animate(withDuration: 0.3) {
                self.transform = CGAffineTransform(scaleX: 1.12, y: 1.12)
            } completion: { _ in
                UIButton.animate(withDuration: 0.3) {
                    self.transform = CGAffineTransform(scaleX: 1.06, y: 1.06)
                } completion: { _ in
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                    UIButton.animate(withDuration: 0.3) {
                        self.transform = CGAffineTransform(scaleX: 1.03, y: 1.04)
                        vibrate(style: .light)
                    } completion: { _ in
                        self.transform = CGAffineTransform(scaleX: 1, y: 1)
                        
                    }
                }
            }
        }
    }
    
    func addVibrateEffect(){
        
        let _ = Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
            
            UIButton.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform(rotationAngle: 0.02)
            } completion: { _ in
                UIButton.animate(withDuration: 0.1) {
                    self.transform = CGAffineTransform(rotationAngle: -0.02)
                   
                } completion: { _ in
                    self.transform = CGAffineTransform(rotationAngle: 0.02)
                    UIButton.animate(withDuration: 0.1) {
                        self.transform = CGAffineTransform(rotationAngle: -0.02)
                    } completion: { _ in
                        self.transform = CGAffineTransform(rotationAngle: 0.0)
                        
                    }
                }
            }
        }
    }
    
    
    
    func setSettingsButton(yPozition: CGFloat, iconName: String, title: String, selector: Selector,addView: UIView,VC: UIViewController){
        
        let icon = UIImage(named: iconName)!
        self.setImage(icon, for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets =  UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 340)
        self.backgroundColor = krem
        self.layer.cornerRadius = 15
        self.contentVerticalAlignment.self = .center
        self.contentHorizontalAlignment.self = .left
        self.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.titleLabel?.font =  UIFont(name: "Gilroy-Medium", size: 16)
        self.frame = CGRect(x: 0.04 * screenWidth, y: yPozition * screenHeight, width: 0.92 * screenWidth, height: 0.08 * screenHeight)
        self.setTitle(NSLocalizedString("         \(title)", comment: ""), for: UIControl.State.normal)
        addView.addSubview(self)
        self.addTarget(VC, action: selector, for: UIControl.Event.touchUpInside)
    }
    
    func makeBackButton(view: UIView, selector: Selector, VC: UIViewController){
        self.setBackgroundImage(UIImage(named: "back_btn"), for: UIControl.State.normal)
        self.frame = CGRect(x: 0.05 * screenWidth, y: 0.065 * screenHeight, width: 0.08 * screenWidth, height: 0.08 * screenWidth)
        view.addSubview(self)
        self.addTarget(VC, action: selector, for: UIControl.Event.touchUpInside)
        
    }
    
}

extension UILabel{
    
    func makeClassicLabel(x:CGFloat, y:CGFloat, w:CGFloat, h:CGFloat, text: String, textColor: UIColor, textSize: CGFloat, textAlignment: NSTextAlignment, addView: UIView ){
        self.frame = CGRect(x: x * screenWidth, y: y * screenHeight, width: w * screenWidth, height: h * screenHeight)
        self.text = text
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font = UIFont(name: "Gilroy-Regular", size: textSize )
        addView.addSubview(self)
    }
}



