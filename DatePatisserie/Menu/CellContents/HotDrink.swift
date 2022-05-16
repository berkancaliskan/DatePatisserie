//
//  HotDrink.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 15.05.2022.
//

import Foundation

struct HotDrink {
    let productName: String
    let price: String
    let imageName: String
    let productStepper: String
}

var hotDrink: [HotDrink] = []

func createHotDrinks() {
    hotDrink = [
       HotDrink(productName: "Ice Coffe Latte",price: "₺24.5", imageName: "sandvic_1", productStepper: ""),
       HotDrink(productName: "Ice Brew", price: "₺21.5", imageName: "sandvic_2", productStepper: ""),
       HotDrink(productName: "Ice Caramel Latte", price: "₺25", imageName: "sandvic_2", productStepper: ""),
       HotDrink(productName: "Ice Oreo Latte", price: "₺25", imageName: "sandvic_1", productStepper: "")
      
    ]
    
}
