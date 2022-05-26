//
//  Product.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 11.05.2022.
//

import Foundation
import UIKit

class Product {
    
    var name: String = ""
    var price: Float = 0.0
    var kcal: Float = 0.0
    var ingredients: String = ""
    var details: String = ""
    var image =  UIImage()
    var type = ProductType.none
    let id = "\(UUID())"
}




enum ProductType {
    case sandwich
    case coldDrink
    case toast
    case iceCoffee
    case hotDrink
    case other
    case dessert
    case coffee
    case burger
    case none
}




