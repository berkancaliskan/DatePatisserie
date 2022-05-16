//
//  Functions.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 28.03.2022.
//

import Foundation
import UIKit


var screenHeight = CGFloat()
var screenWidth = CGFloat()
var stringMultiplier = CGFloat()

func setDefaultSize(view : UIView){
    
    screenHeight = view.frame.size.height
    screenWidth = view.frame.size.width
    stringMultiplier = 0.00115 * screenHeight
   
}
func showCustomAlert(title: String, message: String,  viewController : UIViewController){
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
    viewController.present(alert, animated: true, completion: nil)

}

func vibrate(style : UIImpactFeedbackGenerator.FeedbackStyle){
    
    let generator = UIImpactFeedbackGenerator(style: style)
    generator.impactOccurred()
    
}


