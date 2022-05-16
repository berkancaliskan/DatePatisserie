//
//  Dessert.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 15.05.2022.
//

import Foundation
struct Dessert {
    let productName: String
    let price: String
    let imageName: String
    let productStepper: String
}

var desserts: [Dessert] = []

func createDesserts() {
    desserts = [
        Dessert(productName: "Ice Coffe Latte",price: "₺24.5", imageName: "sandvic_1", productStepper: ""),
        Dessert(productName: "Ice Brew", price: "₺21.5", imageName: "sandvic_2", productStepper: ""),
        Dessert(productName: "Ice Caramel Latte", price: "₺25", imageName: "sandvic_2", productStepper: ""),
        Dessert(productName: "Ice Oreo Latte", price: "₺25", imageName: "sandvic_1", productStepper: "")
      
    ]
    
}
