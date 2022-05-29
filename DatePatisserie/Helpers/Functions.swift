//
//  Functions.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 28.03.2022.
//

import Foundation
import UIKit
import Firebase
import FirebaseFirestore

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
func convertImageToBase64String (img: UIImage) -> String {
    return img.jpegData(compressionQuality: 0.5)?.base64EncodedString() ?? ""
}
func convertBase64StringToImage (imageBase64String:String) -> UIImage {
    let imageData = Data(base64Encoded: imageBase64String)
    let image = UIImage(data: imageData!)
    return image!
}

func getDailyFood() {
    
    let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
        
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        let dateString = df.string(from: date)
        
        //Get specific document from current current date
        let docRef = Firestore.firestore()
            .collection("DailyMeal")
            .document(dateString)
        
        // Get data
        docRef.getDocument { (document, error) in
            guard let document = document, document.exists else {
                print("Document does not exist")
                return
            }
            
            let dataDescription = document.data()
            
            let first_food = dataDescription?["firstMealPhoto"] ?? ""
            let second_food = dataDescription?["secondMealPhoto"] ?? ""
            let third_food =  dataDescription?["thirdMealPhoto"] ?? ""
            let daily_meal_name = dataDescription?["mealNames"] ?? ""
            let daily_meal_desc = dataDescription?["mealDetails"] ?? ""
            
            foodImage1.image = convertBase64StringToImage(imageBase64String: "\(first_food)")
            foodImage2.image = convertBase64StringToImage(imageBase64String: "\(second_food)")
            foodImage3.image = convertBase64StringToImage(imageBase64String: "\(third_food)")
            detailsFoodContentLabel.text = "\(daily_meal_desc)"
            dailyFoodNamesLabel.text = "\(daily_meal_name)"
            
        }
        
        
        
    }
}


func getCoffeeCount() {
    
   
        let userId = Auth.auth().currentUser?.uid
        //Get specific document from current current date
        let docRef = Firestore.firestore()
            .collection("Users")
            .document(userId ?? "CchH9ch8bSYmA7c6O6tbnq6d4n13")
        
        // Get data
        docRef.getDocument { (document, error) in
            guard let document = document, document.exists else {
                print("Document does not exist")
                return
            }
            
            let dataDescription = document.data()
            let qrCount = dataDescription?["coffeCount"] ?? 0
    
            profileInfo.qrCounter = qrCount as! Int
            
            HomeVC().setCoffeeProgress()
        }
}

