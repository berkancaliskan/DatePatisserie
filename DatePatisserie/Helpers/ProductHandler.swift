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
    createDesserts()
    createColdDrinks()
    createHotDrinks()
    createOthers()
    
}


func createSandwiches(){
    
    createProduct(name: "Hindi Fümeli Sandviç", price: 22, kcal: 324, ingredients: "fdg", details: "gdlşks", image: unwrapToImage(variable: UIImage(named: "sandvic_2")as Any), type: .sandwich)
    createProduct(name: "Tavuklu Sandviç", price: 44, kcal: 342, ingredients: "fdg", details: "gdlşks", image: unwrapToImage(variable: UIImage(named: "sandvic_1")as Any), type: .sandwich)
    createProduct(name: "Salamlı Sandviç", price: 35, kcal: 212, ingredients: "fdg", details: "gdlşks", image: unwrapToImage(variable: UIImage(named: "sandwich_2")as Any), type: .sandwich)
    createProduct(name: "Sebzeli Sandviç", price: 27, kcal: 522, ingredients: "fdg", details: "gdlşks", image: unwrapToImage(variable: UIImage(named: "sandwich_2")as Any), type: .sandwich)
  
}
func createToasts(){
    
    createProduct(name: "Kaşarlı Tost", price: 22, kcal: 22, ingredients: "Taze Kaşar, Odun Ekmeği", details: "Özenle hazırlanmış taze kaşarlı tost.", image: UIImage(), type: .toast)
    createProduct(name: "Ayvalık Tost", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .toast)
    createProduct(name: "Bazlama Tost", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .toast)
    createProduct(name: "Karışık Tost", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .toast)
  
}
func createBurgers(){
    
    createProduct(name: "Tavuk Burger", price: 27.5, kcal: 22, ingredients: "fdg", details: "Tavukburger eti, küçük boy susamlı sandviç ekmeği, mayonez ve doğranmış maruldan oluşan son derece sade bir lezzet alternatifi.", image: UIImage(named: "burger_1")!, type: .burger)
    createProduct(name: "Steak Burger", price: 34.5, kcal: 22, ingredients: "fdg", details: "Özel hamburger ekmeğinin arasında kalın bir dilim burger eti, cheddar peyniri, bir yaprak marul ve karamelize soğanla yapılmış enfes bir sos. Yanında patates kızartmasıyla harika bir lezzete dönüşen steak burger", image: UIImage(named: "burger_2")!, type: .burger)
    createProduct(name: "Cheese Burger", price: 32, kcal: 22, ingredients: "fdg", details: "Hamburger eti, küçük boy susamlı sandviç ekmeği, salatalık turşusu, cheddar peyniri, hardal ve ketçaptan oluşan lezzet.", image: UIImage(named: "burger_3")!, type: .burger)
    createProduct(name: "Classic Burger", price: 30.5, kcal: 22, ingredients: "fdg", details: "Hamburger eti, orta boy susamlı sandviç ekmeği dilimlenmis taze soğan, domates, ve maruldan oluşan lezzet.", image: UIImage(named: "burger_4")!, type: .burger)
  
}
func createCoffees(){
    
    
    createProduct(name: "Espresso", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    createProduct(name: "Americano", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    createProduct(name: "Latte", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    createProduct(name: "Cappucino", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    createProduct(name: "Cortado", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    createProduct(name: "Flat White", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    createProduct(name: "Mocha", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    createProduct(name: "Oreo Mocha", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    createProduct(name: "Caramel Mocha", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    createProduct(name: "White Mocha", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    createProduct(name: "Filtre Kahve", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    createProduct(name: "Türk Kahvesi", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .coffee)
    
  
}
func createIceCoffees(){
    
    createProduct(name: "Iced Americano", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .iceCoffee)
    createProduct(name: "Iced Latte", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .iceCoffee)
    createProduct(name: "Iced Mocha", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .iceCoffee)
    createProduct(name: "Iced White Mocha", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .iceCoffee)
    createProduct(name: "Iced Caramel Latte", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .iceCoffee)
   
}
func createDesserts(){
    
    createProduct(name: "Brownie", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "brownie")!, type: .dessert)
    createProduct(name: "dfkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .dessert)
    createProduct(name: "dfkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .dessert)
    createProduct(name: "dfkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .dessert)
    createProduct(name: "dfkljs", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .dessert)

}
func createColdDrinks(){
    
    createProduct(name: "Limonata", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "limonata")!, type: .coldDrink)
    createProduct(name: "Maden Suyu", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "limonata")!, type: .coldDrink)
    createProduct(name: "Ayran", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "ayran")!, type: .coldDrink)
    createProduct(name: "Kola", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "cc")!, type: .coldDrink)
    createProduct(name: "Zero Kola", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "cczero")!, type: .coldDrink)
    createProduct(name: "Fanta", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "limonata")!, type: .coldDrink)
    createProduct(name: "Sprite", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "sprite")!, type: .coldDrink)
    createProduct(name: "Gazoz", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "limonata")!, type: .coldDrink)
    createProduct(name: "Su", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "limonata")!, type: .coldDrink)

    
}
func createHotDrinks(){
    
    createProduct(name: "Çay", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "cczero")!, type: .hotDrink)
    createProduct(name: "Bitki Çayı", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "yesilcay")!, type: .hotDrink)
    createProduct(name: "Sıcak Çikolata", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "cczero")!, type: .hotDrink)
    createProduct(name: "Sahlep", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "cczero")!, type: .hotDrink)
    createProduct(name: "Chai Latte", price: 22, kcal: 22, ingredients: "chai_latte", details: "gdlşks", image: UIImage(named: "cczero")!, type: .hotDrink)
    createProduct(name: "Matcha Latte", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "cczero")!, type: .hotDrink)
    createProduct(name: "Sıcak Süt", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(named: "cczero")!, type: .hotDrink)
 

}
func createOthers(){
    
    createProduct(name: "Gofret", price: 22, kcal: 22, ingredients: "fdg", details: "gofret", image: UIImage(), type: .other)
    createProduct(name: "Granola", price: 22, kcal: 22, ingredients: "fdg", details: "granola", image: UIImage(), type: .other)
    createProduct(name: "Açma", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .other)
    createProduct(name: "Poğaça", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .other)
    createProduct(name: "Çorba", price: 22, kcal: 22, ingredients: "fdg", details: "gdlşks", image: UIImage(), type: .other)
    
}


