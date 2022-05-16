//
//  Other.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 15.05.2022.
//

import Foundation

struct Other {
    let productName: String
    let price: String
    let imageName: String
    let productStepper: String
}

var others: [Other] = []

func createOthers() {
    others = [
       Other(productName: "Ice Coffe Latte",price: "₺24.5", imageName: "sandvic_1", productStepper: ""),
       Other(productName: "Ice Brew", price: "₺21.5", imageName: "sandvic_2", productStepper: ""),
       Other(productName: "Ice Caramel Latte", price: "₺25", imageName: "sandvic_2", productStepper: ""),
       Other(productName: "Ice Oreo Latte", price: "₺25", imageName: "sandvic_1", productStepper: "")
      
    ]
    
}
