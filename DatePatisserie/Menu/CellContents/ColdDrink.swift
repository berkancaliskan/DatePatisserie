//
//  ColdDrink.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 15.05.2022.
//

import Foundation

struct ColdDrink {
    let productName: String
    let price: String
    let imageName: String
    let productStepper: String
}

var coldDrinks: [ColdDrink] = []

func createColdDrinks() {
    coldDrinks = [
       ColdDrink(productName: "Ice Latte",price: "₺24.5", imageName: "sandvic_1", productStepper: ""),
       ColdDrink(productName: "Jambonlu Sandviç", price: "₺21.5", imageName: "sandvic_2", productStepper: ""),
       ColdDrink(productName: "Salamlı Sandviç", price: "₺25", imageName: "sandvic_2", productStepper: ""),
       ColdDrink(productName: "Sebzeli Sandviç", price: "₺25", imageName: "sandvic_1", productStepper: "")
      
    ]
    
}
