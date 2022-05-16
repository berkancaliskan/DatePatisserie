//
//  IceCoffee.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 15.05.2022.
//

import Foundation

struct IceCoffee {
    let productName: String
    let price: String
    let imageName: String
    let productStepper: String
}

var iceCoffees: [IceCoffee] = []

func createIceCoffees() {
    iceCoffees = [
       IceCoffee(productName: "Ice Coffe Latte",price: "₺24.5", imageName: "sandvic_1", productStepper: ""),
       IceCoffee(productName: "Ice Brew", price: "₺21.5", imageName: "sandvic_2", productStepper: ""),
       IceCoffee(productName: "Ice Caramel Latte", price: "₺25", imageName: "sandvic_2", productStepper: ""),
       IceCoffee(productName: "Ice Oreo Latte", price: "₺25", imageName: "sandvic_1", productStepper: "")
      
    ]
    
}
