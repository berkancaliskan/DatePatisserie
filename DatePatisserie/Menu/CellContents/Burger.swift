//
//  Burger.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 15.05.2022.
//

import Foundation
struct Burger {
    let productName: String
    let price: String
    let imageName: String
    let productStepper: String
}

var burgers: [Burger] = []

func createBurgers() {
    burgers = [
        Burger(productName: "burger1",price: "₺24.5", imageName: "sandvic_1", productStepper: ""),
        Burger(productName: "burger2", price: "₺21.5", imageName: "sandvic_2", productStepper: ""),
        Burger(productName: "burger3", price: "₺25", imageName: "sandvic_2", productStepper: ""),
        Burger(productName: "burger4", price: "₺25", imageName: "sandvic_1", productStepper: "")
      
    ]
    
}
