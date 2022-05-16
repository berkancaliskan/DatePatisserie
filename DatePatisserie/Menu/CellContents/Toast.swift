//
//  Toast.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 15.05.2022.
//

import Foundation
struct Toast {
    let productName: String
    let price: String
    let imageName: String
    let productStepper: String
}

var toasts: [Toast] = []

func createToasts() {
    toasts = [
        Toast(productName: "Ice Coffe Latte",price: "₺24.5", imageName: "sandvic_1", productStepper: ""),
        Toast(productName: "Ice Brew", price: "₺21.5", imageName: "sandvic_2", productStepper: ""),
        Toast(productName: "Ice Caramel Latte", price: "₺25", imageName: "sandvic_2", productStepper: ""),
        Toast(productName: "Ice Oreo Latte", price: "₺25", imageName: "sandvic_1", productStepper: "")
      
    ]
    
}
