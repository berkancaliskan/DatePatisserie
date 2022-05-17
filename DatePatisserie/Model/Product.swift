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


func createProduct(name : String, price : Float , kcal : Float ,ingredients : String , details : String , image : UIImage  , type : ProductType){
    
     let product = Product()
    product.name  = name
    product.price = price
    product.kcal = kcal
    product.ingredients = ingredients
    product.details = details
    product.image =  image
    product.type = type
    arrProducts.append(product)
    
}



