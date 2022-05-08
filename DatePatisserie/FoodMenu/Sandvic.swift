//
//  Profile.swift
//  UICollectionView
//
//  Created by Berkan Çalışkan on 24.02.2022.
//

import Foundation


struct Sandvic {
    let productName: String
    let price: String
    let imageName: String
    let productStepper: String
}

struct Burger {
    let productName: String
    let price: String
    let imageName: String
    let productStepper: String
}


var sandwiches: [Sandvic] = []
var burgers: [Burger] = []

func createSandwiches() {
    sandwiches = [
       Sandvic(productName: "Tavuklu Sandviç",price: "₺24.5", imageName: "sandvic_1", productStepper: ""),
       Sandvic(productName: "Jambonlu Sandviç", price: "₺21.5", imageName: "sandvic_2", productStepper: ""),
       Sandvic(productName: "Salamlı Sandviç", price: "₺25", imageName: "sandvic_2", productStepper: ""),
       Sandvic(productName: "Sebzeli Sandviç", price: "₺25", imageName: "sandvic_1", productStepper: "")
      
      
   ]
    
    burgers = [
       Burger(productName: "Tavuk Burger",price: "₺24.5", imageName: "sandvic_1", productStepper: ""),
       Burger(productName: "Steak Burger", price: "₺21.5", imageName: "sandvic_2", productStepper: ""),
       Burger(productName: "Cheese Burger", price: "₺25", imageName: "sandvic_2", productStepper: ""),
       Burger(productName: "Double Burger", price: "₺25", imageName: "sandvic_1", productStepper: "")
      
      
   ]
}
