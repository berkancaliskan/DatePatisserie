//
//  Globals.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 27.01.2022.
//

import Foundation
import UIKit




var screenHeight = CGFloat()
var screenWidth = CGFloat()
var stringMultiplier = CGFloat()
var ScreenWidth_To_ScreenHeight_Converter = CGFloat()
var ScreenHeight_To_ScreenWidth_Converter = CGFloat()


func setDefaultSize(view : UIView){

    screenHeight = view.frame.size.height
    screenWidth = view.frame.size.width
    stringMultiplier = 0.00115 * screenHeight
    ScreenWidth_To_ScreenHeight_Converter = 1 / screenWidth * screenHeight / 2.1642
    ScreenHeight_To_ScreenWidth_Converter = 1 / screenHeight * screenWidth / 0.4620
}
extension UIView{
    func adapt_width_to_SH(){
       
      self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width * ScreenWidth_To_ScreenHeight_Converter, height: self.frame.height)
    }
    func adapt_height_to_SW(){
       
      self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: self.frame.height * ScreenHeight_To_ScreenWidth_Converter)
    }
    func adapt_x_to_SH(){
       
      self.frame = CGRect(x: self.frame.minX * ScreenWidth_To_ScreenHeight_Converter, y: self.frame.minY, width: self.frame.width, height: self.frame.height)
    }
    func adapt_y_to_SW(){
       
      self.frame = CGRect(x: self.frame.minX, y: self.frame.minY * ScreenHeight_To_ScreenWidth_Converter, width: self.frame.width, height: self.frame.height)
    }
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

extension UIViewController {
    func showInputDialog(title:String? = nil,
                         subtitle:String? = nil,
                         actionTitle:String? = "Add",
                         cancelTitle:String? = "Cancel",
                         inputPlaceholder:String? = nil,
                         inputKeyboardType:UIKeyboardType = UIKeyboardType.default,
                         cancelHandler: ((UIAlertAction) -> Swift.Void)? = nil,
                         actionHandler: ((_ text: String?) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = inputPlaceholder
            textField.keyboardType = inputKeyboardType
        }
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (action:UIAlertAction) in
            guard let textField =  alert.textFields?.first else {
                actionHandler?(nil)
                return
            }
            actionHandler?(textField.text)
        }))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
}


enum senderVC {
    case None
    case Settings
    case Walktrough
}

