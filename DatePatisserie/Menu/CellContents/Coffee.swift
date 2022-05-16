//
//  Coffee.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 15.05.2022.
//

import Foundation
struct Coffee {
    let productName: String
    let price: String
    let imageName: String
    let productStepper: String
}

var coffees: [Coffee] = []

func createCoffees() {
    coffees = [
        Coffee(productName: "Ice Coffe Latte",price: "₺24.5", imageName: "sandvic_1", productStepper: ""),
        Coffee(productName: "Ice Brew", price: "₺21.5", imageName: "sandvic_2", productStepper: ""),
        Coffee(productName: "Ice Caramel Latte", price: "₺25", imageName: "sandvic_2", productStepper: ""),
        Coffee(productName: "Ice Oreo Latte", price: "₺25", imageName: "sandvic_1", productStepper: "")
      
    ]
    
}
