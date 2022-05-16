//
//  Profile.swift
//  UICollectionView
//
//  Created by Berkan Çalışkan on 24.02.2022.
//

import Foundation


struct Sandwich {
    let productName: String
    let price: String
    let imageName: String
    let productStepper: String
}

var sandwiches: [Sandwich] = []


func createSandwiches() {
    sandwiches = [
       Sandwich(productName: "Tavuklu Sandviç",price: "₺24.5", imageName: "sandvic_1", productStepper: ""),
       Sandwich(productName: "Jambonlu Sandviç", price: "₺21.5", imageName: "sandvic_2", productStepper: ""),
       Sandwich(productName: "Salamlı Sandviç", price: "₺25", imageName: "sandvic_2", productStepper: ""),
       Sandwich(productName: "Sebzeli Sandviç", price: "₺25", imageName: "sandvic_1", productStepper: "")
      
    ]
    
}
