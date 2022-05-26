//
//  ProductHandler.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 17.05.2022.
//

import Foundation
import UIKit


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

func createProducts(){
    
    createSandwiches()
    createToasts()
    createBurgers()
    createCoffees()
    createIceCoffees()
    
}


func createSandwiches(){
    
    createProduct(name: "dfkljs", price: 22, kcal: 324, ingredients: "fdg", details: "gdlşks", image: unwrapToImage(variable: UIImage(named: "sandvic_2")as Any), type: .sandwich)
    createProduct(name: "dfkljs", price: 44, kcal: 342, ingredients: "fdg", details: "gdlşks", image: unwrapToImage(variable: UIImage(named: "sandvic_1")as Any), type: .sandwich)
    createProduct(name: "dfkljs", price: 35, kcal: 212, ingredients: "fdg", details: "gdlşks", image: unwrapToImage(variable: UIImage(named: "sandwich_2")as Any), type: .sandwich)
    createProduct(name: "dfkljs", price: 27, kcal: 522, ingredients: "fdg", details: "gdlşks", image: unwrapToImage(variable: UIImage(named: "sandwich_2")as Any), type: .sandwich)
  
}
func createToasts(){
    
    createProduct(name: "33dfkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .toast)
    createProduct(name: "3r3dfkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .toast)
    createProduct(name: "deddfkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .toast)
    createProduct(name: "dfkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .toast)
  
}
func createBurgers(){
    
    createProduct(name: "Tavuk Burger", price: 27.5, kcal: 22, ingredients: "fdg", details: "Tavukburger eti, küçük boy susamlı sandviç ekmeği, mayonez ve doğranmış maruldan oluşan son derece sade bir lezzet alternatifi.", image: UIImage(named: "burger_1")!, type: .burger)
    createProduct(name: "Steak Burger", price: 34.5, kcal: 22, ingredients: "fdg", details: "Özel hamburger ekmeğinin arasında kalın bir dilim burger eti, cheddar peyniri, bir yaprak marul ve karamelize soğanla yapılmış enfes bir sos. Yanında patates kızartmasıyla harika bir lezzete dönüşen steak burger", image: UIImage(named: "burger_2")!, type: .burger)
    createProduct(name: "Cheese Burger", price: 32, kcal: 22, ingredients: "fdg", details: "Hamburger eti, küçük boy susamlı sandviç ekmeği, salatalık turşusu, cheddar peyniri, hardal ve ketçaptan oluşan lezzet.", image: UIImage(named: "burger_3")!, type: .burger)
    createProduct(name: "Classic Burger", price: 30.5, kcal: 22, ingredients: "fdg", details: "Hamburger eti, orta boy susamlı sandviç ekmeği dilimlenmis taze soğan, domates, ve maruldan oluşan lezzet.", image: UIImage(named: "burger_4")!, type: .burger)
  
}
func createCoffees(){
    
    
    createProduct(name: "dnh2fedhjedfkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    createProduct(name: "df7575237kljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    createProduct(name: "d757257fkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    createProduct(name: "df29977997kljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    
  
}
func createIceCoffees(){
    
    createProduct(name: "dfkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .iceCoffee)
  
}
func createDesserts(){
    
    createProduct(name: "dfkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .dessert)

}
func createColdDrinks(){
    
    createProduct(name: "dfkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coldDrink)

}
func createHotDrinks(){
    
    createProduct(name: "dfkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .hotDrink)

}
func createOthers(){
    
    createProduct(name: "dfkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .other)

}


