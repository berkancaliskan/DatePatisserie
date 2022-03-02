//
//  LottieVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 29.01.2022.
//
import Foundation
import UIKit
import TinyConstraints

var allbeveragesArray = [Beverage]()
var beverageArray = [Beverage]()
var categoryArray = [Category]()

class Beverage{
    
    var name = ""
    var waterRate = 0
    var image = UIImage()
    var category = Category()
    var imageName = ""
    
    func setMenu(){
        
        categoryArray.removeAll()
        
    let water = Category()
    water.name = NSLocalizedString( "Burger" , comment: "" )
    water.image = UIImage(named: "WaterSymbol")!
    water.ID = "water"
    categoryArray.append(water)
        
    let soda = Category()
    soda.name = NSLocalizedString( "Tost" , comment: "")
    soda.image = UIImage(named: "SodaSymbol")!
    soda.ID = "soda"
    categoryArray.append(soda)
      
    let coffee = Category()
    coffee.name = NSLocalizedString( "Coffees" , comment: "")
    coffee.image = UIImage(named: "CoffeeSymbol")!
    coffee.ID = "coffee"
    categoryArray.append(coffee)
        
        
    
    let alcohols = Category()
    alcohols.name = NSLocalizedString( "Alcohols" , comment: "")
    alcohols.image = UIImage(named: "AlcoholSymbol")!
    alcohols.ID = "alcohol"
    categoryArray.append(alcohols)

    let milk = Category()
    milk.name = NSLocalizedString( "Milks" , comment: "")
    milk.image = UIImage(named: "MilkSymbol")!
    milk.ID = "milk"
    categoryArray.append(milk)
        
   
        
    let tea = Category()
    tea.name = NSLocalizedString( "Teas" , comment: "")
    tea.image = UIImage(named: "TeaSymbol")!
    tea.ID = "tea"
    categoryArray.append(tea)
        
    let juice = Category()
    juice.name = NSLocalizedString( "Juices" , comment: "")
    juice.image = UIImage(named: "JuiceSymbol")!
    juice.ID = "juice"
    categoryArray.append(juice)
        
    let detox = Category()
    detox.name = NSLocalizedString( "Detox" , comment: "")
    detox.image = UIImage(named: "DetoxSymbol")!
    detox.ID = "detoks"
    categoryArray.append(detox)
        
    let others = Category()
    others.name = NSLocalizedString( "Others" , comment: "")
    others.image = UIImage(named: "OthersSymbol")!
    others.ID = "others"
    categoryArray.append(others)
        
    
//    Coffees
        
        
    let coffee1 = Beverage()
    coffee1.category = coffee
    coffee1.image = UIImage(named: "americano")!
    coffee1.name = NSLocalizedString( "Americano" , comment: "")
    coffee1.waterRate = 96
    coffee1.imageName = "americano"
    allbeveragesArray.append(coffee1)
        
    let coffee2 = Beverage()
    coffee2.category = coffee
    coffee2.image = UIImage(named: "buzlukahve")!
    coffee2.name = NSLocalizedString( "Iced Coffee" , comment: "")
    coffee2.waterRate = 86
    coffee2.imageName = "buzlukahve"
    allbeveragesArray.append(coffee2)
        
    let coffee3 = Beverage()
    coffee3.category = coffee
    coffee3.image = UIImage(named: "cappucino")!
    coffee3.name = NSLocalizedString( "Cappucino" , comment: "")
    coffee3.waterRate = 80
    coffee3.imageName = "cappucino"
    allbeveragesArray.append(coffee3)
        
    let coffee4 = Beverage()
    coffee4.category = coffee
    coffee4.image = UIImage(named: "chicory")!
    coffee4.name = NSLocalizedString( "Chicory" , comment: "")
    coffee4.waterRate = 95
    coffee4.imageName = "chicory"
    allbeveragesArray.append(coffee4)
        
    let coffee5 = Beverage()
    coffee5.category = coffee
    coffee5.image = UIImage(named: "cortado")!
    coffee5.name = NSLocalizedString( "Cortado" , comment: "")
    coffee5.waterRate = 92
    coffee5.imageName = "cortado"
    allbeveragesArray.append(coffee5)
        
    let coffee6 = Beverage()
    coffee6.category = coffee
    coffee6.image = UIImage(named: "espresso")!
    coffee6.name = NSLocalizedString( "Espresso" , comment: "")
    coffee6.waterRate = 89
    coffee6.imageName = "espresso"
    allbeveragesArray.append(coffee6)
        
    let coffee7 = Beverage()
    coffee7.category = coffee
    coffee7.image = UIImage(named: "flatwhite")!
    coffee7.name = NSLocalizedString( "Flat white" , comment: "")
    coffee7.waterRate = 78
    coffee7.imageName = "flatwhite"
    allbeveragesArray.append(coffee7)
        
    let coffee8 = Beverage()
    coffee8.category = coffee
    coffee8.image = UIImage(named: "kafeinsizkahve")!
    coffee8.name = NSLocalizedString( "Decaf" , comment: "")
    coffee8.waterRate = 97
    coffee8.imageName = "kafeinsizkahve"
    allbeveragesArray.append(coffee8)
        
    let coffee9 = Beverage()
    coffee9.category = coffee
    coffee9.image = UIImage(named: "kahve")!
    coffee9.name = NSLocalizedString( "Coffee" , comment: "")
    coffee9.waterRate = 80
    coffee9.imageName = "kahve"
    allbeveragesArray.append(coffee9)
        
    let coffee10 = Beverage()
    coffee10.category = coffee
    coffee10.image = UIImage(named: "latte")!
    coffee10.name = NSLocalizedString( "Latte" , comment: "")
    coffee10.waterRate = 65
    coffee10.imageName = "latte"
    allbeveragesArray.append(coffee10)
        
        
    let coffee11 = Beverage()
    coffee11.category = coffee
    coffee11.image = UIImage(named: "macchiato")!
    coffee11.name = NSLocalizedString( "Macchiato" , comment: "")
    coffee11.waterRate = 82
    coffee11.imageName = "macchiato"
    allbeveragesArray.append(coffee11)
        
    let coffee12 = Beverage()
    coffee12.category = coffee
    coffee12.image = UIImage(named: "mocha")!
    coffee12.name = NSLocalizedString( "Mocha" , comment: "")
    coffee12.waterRate = 80
    coffee12.imageName = "mocha"
    allbeveragesArray.append(coffee12)
        
    let coffee13 = Beverage()
    coffee13.category = coffee
    coffee13.image = UIImage(named: "sogukkahve")!
    coffee13.name = NSLocalizedString( "Cold Brew" , comment: "")
    coffee13.waterRate = 92
    coffee13.imageName = "sogukkahve"
    allbeveragesArray.append(coffee13)
        
  //Alcohols
        
        let alcohol1 = Beverage()
        alcohol1.category = alcohols
        alcohol1.image = UIImage(named: "beyazsarap")!
        alcohol1.name = NSLocalizedString( "White Wine" , comment: "")
        alcohol1.waterRate = -140
        alcohol1.imageName = "beyazsarap"
        allbeveragesArray.append(alcohol1)
        
        let alcohol2 = Beverage()
        alcohol2.category = alcohols
        alcohol2.image = UIImage(named: "bira")!
        alcohol2.name = NSLocalizedString( "Beer" , comment: "")
        alcohol2.waterRate = -60
        alcohol2.imageName = "bira"
        allbeveragesArray.append(alcohol2)
        
        let alcohol3 = Beverage()
        alcohol3.category = alcohols
        alcohol3.image = UIImage(named: "brendi")!
        alcohol3.name = NSLocalizedString( "Brandi" , comment: "")
        alcohol3.waterRate = -480
        alcohol3.imageName = "brendi"
        allbeveragesArray.append(alcohol3)
        
        let alcohol4 = Beverage()
        alcohol4.category = alcohols
        alcohol4.image = UIImage(named: "elmasarabi")!
        alcohol4.name = NSLocalizedString( "Apple Wine" , comment: "")
        alcohol4.waterRate = -50
        alcohol4.imageName = "elmasarabi"
        allbeveragesArray.append(alcohol4)
        
        let alcohol5 = Beverage()
        alcohol5.category = alcohols
        alcohol5.image = UIImage(named: "gin")!
        alcohol5.name = NSLocalizedString( "Gin" , comment: "")
        alcohol5.waterRate = -480
        alcohol5.imageName = "gin"
        allbeveragesArray.append(alcohol5)
        
        let alcohol6 = Beverage()
        alcohol6.category = alcohols
        alcohol6.image = UIImage(named: "kirmizisarap")!
        alcohol6.name = NSLocalizedString( "Red Wine" , comment: "")
        alcohol6.waterRate = -160
        alcohol6.imageName = "kirmizisarap"
        allbeveragesArray.append(alcohol6)
        
        let alcohol7 = Beverage()
        alcohol7.category = alcohols
        alcohol7.image = UIImage(named: "kopuklusarap")!
        alcohol7.name = NSLocalizedString( "Sparkling Wine" , comment: "")
        alcohol7.waterRate = -140
        alcohol7.imageName = "kopuklusarap"
        allbeveragesArray.append(alcohol7)
        
        let alcohol8 = Beverage()
        alcohol8.category = alcohols
        alcohol8.image = UIImage(named: "mojito")!
        alcohol8.name = NSLocalizedString( "Mojito" , comment: "")
        alcohol8.waterRate = -150
        alcohol8.imageName = "mojito"
        allbeveragesArray.append(alcohol8)
        
        let alcohol9 = Beverage()
        alcohol9.category = alcohols
        alcohol9.image = UIImage(named: "rom")!
        alcohol9.name = NSLocalizedString( "Rom" , comment: "")
        alcohol9.waterRate = -480
        alcohol9.imageName = "rom"
        allbeveragesArray.append(alcohol9)
        
        let alcohol10 = Beverage()
        alcohol10.category = alcohols
        alcohol10.image = UIImage(named: "sake")!
        alcohol10.name = NSLocalizedString( "Sake" , comment: "")
        alcohol10.waterRate = -120
        alcohol10.imageName = "sake"
        allbeveragesArray.append(alcohol10)
        
        let alcohol11 = Beverage()
        alcohol11.category = alcohols
        alcohol11.image = UIImage(named: "sangria")!
        alcohol11.name = NSLocalizedString( "Sangria" , comment: "")
        alcohol11.waterRate = -180
        alcohol11.imageName = "sangria"
        allbeveragesArray.append(alcohol11)
        
        let alcohol12 = Beverage()
        alcohol12.category = alcohols
        alcohol12.image = UIImage(named: "spritz")!
        alcohol12.name = NSLocalizedString( "Spritz" , comment: "")
        alcohol12.waterRate = -120
        alcohol12.imageName = "spritz"
        allbeveragesArray.append(alcohol12)
        
        let alcohol13 = Beverage()
        alcohol13.category = alcohols
        alcohol13.image = UIImage(named: "tekila")!
        alcohol13.name = NSLocalizedString( "Tequila" , comment: "")
        alcohol13.waterRate = -480
        alcohol13.imageName = "tekila"
        allbeveragesArray.append(alcohol13)
        
        let alcohol14 = Beverage()
        alcohol14.category = alcohols
        alcohol14.image = UIImage(named: "viski")!
        alcohol14.name = NSLocalizedString( "Whiskey" , comment: "")
        alcohol14.waterRate = -480
        alcohol14.imageName = "viski"
        allbeveragesArray.append(alcohol14)
        
        let alcohol15 = Beverage()
        alcohol15.category = alcohols
        alcohol15.image = UIImage(named: "votka")!
        alcohol15.name = NSLocalizedString( "Vodka" , comment: "")
        alcohol15.waterRate = -480
        alcohol15.imageName = "votka"
        allbeveragesArray.append(alcohol15)
        
        // Waters
        
        let water1 = Beverage()
        water1.category = water
        water1.image = UIImage(named: "alkalensu")!
        water1.name = NSLocalizedString( "Water" , comment: "")
        water1.waterRate = 100
        water1.imageName = "alkalensu"
        allbeveragesArray.append(water1)
        
        let water2 = Beverage()
        water2.category = water
        water2.image = UIImage(named: "aloesuyu")!
        water2.name = NSLocalizedString( "Aloe Water" , comment: "")
        water2.waterRate = 96
        water2.imageName = "aloesuyu"
        allbeveragesArray.append(water2)
        
        let water3 = Beverage()
        water3.category = water
        water3.image = UIImage(named: "antioksidansu")!
        water3.name = NSLocalizedString( "Antioxidant Water" , comment: "")
        water3.waterRate = 98
        water3.imageName = "antioksidansu"
        allbeveragesArray.append(water3)
        
        let water4 = Beverage()
        water4.category = water
        water4.image = UIImage(named: "artezyensu")!
        water4.name = NSLocalizedString( "Artesian Water" , comment: "")
        water4.waterRate = 100
        water4.imageName = "artezyensu"
        allbeveragesArray.append(water4)
        
        let water5 = Beverage()
        water5.category = water
        water5.image = UIImage(named: "hindistancevizisuyu")!
        water5.name = NSLocalizedString( "Coconut Water" , comment: "")
        water5.waterRate = 95
        water5.imageName = "hindistancevizisuyu"
        allbeveragesArray.append(water5)
        
        let water6 = Beverage()
        water6.category = water
        water6.image = UIImage(named: "madensuyu")!
        water6.name = NSLocalizedString( "Sparkling Water" , comment: "")
        water6.waterRate = 95
        water6.imageName = "madensuyu"
        allbeveragesArray.append(water6)
    
        let water7 = Beverage()
        water7.category = water
        water7.image = UIImage(named: "vitaminsuyu")!
        water7.name = NSLocalizedString( "Vitamin Water" , comment: "")
        water7.waterRate = 99
        water7.imageName = "vitaminsuyu"
        allbeveragesArray.append(water7)
        
        // Sodas
        
        let soda1 = Beverage()
        soda1.category = soda
        soda1.image = UIImage(named: "Soda")!
        soda1.name = NSLocalizedString( "Soda" , comment: "")
        soda1.waterRate = 88
        soda1.imageName = "Soda"
        allbeveragesArray.append(soda1)
        
        let soda2 = Beverage()
        soda2.category = soda
        soda2.image = UIImage(named: "cileklisoda")!
        soda2.name = NSLocalizedString( "Strawberry Soda" , comment: "")
        soda2.waterRate = 88
        soda2.imageName = "cileklisoda"
        allbeveragesArray.append(soda2)
        
        let soda3 = Beverage()
        soda3.category = soda
        soda3.image = UIImage(named: "kola")!
        soda3.name = NSLocalizedString( "Coke" , comment: "")
        soda3.waterRate = 89
        soda3.imageName = "kola"
        allbeveragesArray.append(soda3)
        
        let soda4 = Beverage()
        soda4.category = soda
        soda4.image = UIImage(named: "dietkola")!
        soda4.name = NSLocalizedString( "Diet Coke" , comment: "")
        soda4.waterRate = 99
        soda4.imageName = "dietkola"
        allbeveragesArray.append(soda4)
        
        let soda5 = Beverage()
        soda5.category = soda
        soda5.image = UIImage(named: "zerokola")!
        soda5.name = NSLocalizedString( "Zero Coke" , comment: "")
        soda5.waterRate = 99
        soda5.imageName = "zerokola"
        allbeveragesArray.append(soda5)
        
        let soda6 = Beverage()
        soda6.category = soda
        soda6.image = UIImage(named: "kulupsoda")!
        soda6.name = NSLocalizedString( "Club Soda" , comment: "")
        soda6.waterRate = 99
        soda6.imageName = "kulupsoda"
        allbeveragesArray.append(soda6)
        
        let soda7 = Beverage()
        soda7.category = soda
        soda7.image = UIImage(named: "limonlusoda")!
        soda7.name = NSLocalizedString( "Lemon Soda" , comment: "")
        soda7.waterRate = 89
        soda7.imageName = "limonlusoda"
        allbeveragesArray.append(soda7)
        
        let soda8 = Beverage()
        soda8.category = soda
        soda8.image = UIImage(named: "zencefilligazoz")!
        soda8.name = NSLocalizedString( "Ginger Ale" , comment: "")
        soda8.waterRate = 91
        soda8.imageName = "zencefilligazoz"
        allbeveragesArray.append(soda8)
        
        let soda9 = Beverage()
        soda9.category = soda
        soda9.image = UIImage(named: "vanilyalisoda")!
        soda9.name = NSLocalizedString( "Vanilla Soda" , comment: "")
        soda9.waterRate = 86
        soda9.imageName = "vanilyalisoda"
        allbeveragesArray.append(soda9)
        
        let soda10 = Beverage()
        soda10.category = soda
        soda10.image = UIImage(named: "slurpee")!
        soda10.name = NSLocalizedString( "Slurpee" , comment: "")
        soda10.waterRate = 35
        soda10.imageName = "slurpee"
        allbeveragesArray.append(soda10)
        
        let soda11 = Beverage()
        soda11.category = soda
        soda11.image = UIImage(named: "tonik")!
        soda11.name = NSLocalizedString( "Tonic Water" , comment: "")
        soda11.waterRate = 91
        soda11.imageName = "tonik"
        allbeveragesArray.append(soda11)
        
        let soda12 = Beverage()
        soda12.category = soda
        soda12.image = UIImage(named: "alkolsuzbira")!
        soda12.name = NSLocalizedString( "No Alc.Beer" , comment: "")
        soda12.waterRate = 90
        soda12.imageName = "alkolsuzbira"
        allbeveragesArray.append(soda12)
        
        let soda13 = Beverage()
        soda13.category = soda
        soda13.image = UIImage(named: "portakallisoda")!
        soda13.name = NSLocalizedString( "Orange Soda" , comment: "")
        soda13.waterRate = 90
        soda13.imageName = "portakallisoda"
        allbeveragesArray.append(soda13)
        
        let soda14 = Beverage()
        soda14.category = soda
        soda14.image = UIImage(named: "visnelisoda")!
        soda14.name = NSLocalizedString( "Cherry Soda" , comment: "")
        soda14.waterRate = 88
        soda14.imageName = "visnelisoda"
        allbeveragesArray.append(soda14)
        
        // Juices
        
        
        let juice1 = Beverage()
        juice1.category = juice
        juice1.image = UIImage(named: "elmasuyu")!
        juice1.name = NSLocalizedString( "Apple Juice" , comment: "")
        juice1.waterRate = 80
        juice1.imageName = "elmasuyu"
        allbeveragesArray.append(juice1)
        
        let juice2 = Beverage()
        juice2.category = juice
        juice2.image = UIImage(named: "domatessuyu")!
        juice2.name = NSLocalizedString( "Tomato Juice" , comment: "")
        juice2.waterRate = 93
        juice2.imageName = "domatessuyu"
        allbeveragesArray.append(juice2)
        
        let juice3 = Beverage()
        juice3.category = juice
        juice3.image = UIImage(named: "havucsuyu")!
        juice3.name = NSLocalizedString( "Carrot Juice" , comment: "")
        juice3.waterRate = 89
        juice3.imageName = "havucsuyu"
        allbeveragesArray.append(juice3)
        
        let juice4 = Beverage()
        juice4.category = juice
        juice4.image = UIImage(named: "kissel")!
        juice4.name = NSLocalizedString( "Kissel" , comment: "")
        juice4.waterRate = 60
        juice4.imageName = "kissel"
        allbeveragesArray.append(juice4)
        
        let juice5 = Beverage()
        juice5.category = juice
        juice5.image = UIImage(named: "komposto")!
        juice5.name = NSLocalizedString( "Compote" , comment: "")
        juice5.waterRate = 70
        juice5.imageName = "komposto"
        allbeveragesArray.append(juice5)
        
        let juice6 = Beverage()
        juice6.category = juice
        juice6.image = UIImage(named: "koolaid")!
        juice6.name = NSLocalizedString( "Kool-Aid" , comment: "")
        juice6.waterRate = 75
        juice6.imageName = "koolaid"
        allbeveragesArray.append(juice6)
        
        let juice7 = Beverage()
        juice7.category = juice
        juice7.image = UIImage(named: "limonata")!
        juice7.name = NSLocalizedString( "Lemonade" , comment: "")
        juice7.waterRate = 89
        juice7.imageName = "limonata"
        allbeveragesArray.append(juice7)
        
        let juice8 = Beverage()
        juice8.category = juice
        juice8.image = UIImage(named: "limonsuyu")!
        juice8.name = NSLocalizedString( "Lemon Juice" , comment: "")
        juice8.waterRate = 100
        juice8.imageName = "limonsuyu"
        allbeveragesArray.append(juice8)
        
        let juice9 = Beverage()
        juice9.category = juice
        juice9.image = UIImage(named: "meyvesuyu")!
        juice9.name = NSLocalizedString( "Juice" , comment: "")
        juice9.waterRate = 68
        juice9.imageName = "meyvesuyu"
        allbeveragesArray.append(juice9)
        
        let juice10 = Beverage()
        juice10.category = juice
        juice10.image = UIImage(named: "mors")!
        juice10.name = NSLocalizedString( "Mors" , comment: "")
        juice10.waterRate = 80
        juice10.imageName = "mors"
        allbeveragesArray.append(juice10)
        
        let juice11 = Beverage()
        juice11.category = juice
        juice11.image = UIImage(named: "portakalsuyu")!
        juice11.name = NSLocalizedString( "Orange Juice" , comment: "")
        juice11.waterRate = 87
        juice11.imageName = "portakalsuyu"
        allbeveragesArray.append(juice11)
        
        let juice12 = Beverage()
        juice12.category = juice
        juice12.image = UIImage(named: "salataliksuyu")!
        juice12.name = NSLocalizedString( "Cucumber Juice" , comment: "")
        juice12.waterRate = 100
        juice12.imageName = "elmasuyu"
        allbeveragesArray.append(juice12)
        
        let juice13 = Beverage()
        juice13.category = juice
        juice13.image = UIImage(named: "yabanmersinisuyu")!
        juice13.name = NSLocalizedString( "Cranberry" , comment: "")
        juice13.waterRate = 87
        juice13.imageName = "yabanmersinisuyu"
        allbeveragesArray.append(juice13)
        
        let juice14 = Beverage()
        juice14.category = juice
        juice14.image = UIImage(named: "smoothie")!
        juice14.name = NSLocalizedString( "Smoothie" , comment: "")
        juice14.waterRate = 86
        juice14.imageName = "smoothie"
        allbeveragesArray.append(juice14)
        
        let juice15 = Beverage()
        juice15.category = juice
        juice15.image = UIImage(named: "uzumsuyu")!
        juice15.name = NSLocalizedString( "Grape Juice" , comment: "")
        juice15.waterRate = 85
        juice15.imageName = "uzumsuyu"
        allbeveragesArray.append(juice15)
        
        
        // Detoks
        
        let detox1 = Beverage()
        detox1.category = detox
        detox1.image = UIImage(named: "enerjiicecegi")!
        detox1.name = NSLocalizedString( "Energy Drink" , comment: "")
        detox1.waterRate = 88
        detox1.imageName = "enerjiicecegi"
        allbeveragesArray.append(detox1)
        
        let detox2 = Beverage()
        detox2.category = detox
        detox2.image = UIImage(named: "kurtarmaicecegi")!
        detox2.name = NSLocalizedString( "Recovery Drink" , comment: "")
        detox2.waterRate = 92
        detox2.imageName = "kurtarmaicecegi"
        allbeveragesArray.append(detox2)
        
        let detox3 = Beverage()
        detox3.category = detox
        detox3.image = UIImage(named: "proteinicecegi")!
        detox3.name = NSLocalizedString( "Protein Shake" , comment: "")
        detox3.waterRate = 92
        detox3.imageName = "proteinicecegi"
        allbeveragesArray.append(detox3)
        
        let detox4 = Beverage()
        detox4.category = detox
        detox4.image = UIImage(named: "sporcuicecegi")!
        detox4.name = NSLocalizedString( "Sports Drink" , comment: "")
        detox4.waterRate = 93
        detox4.imageName = "sporcuicecegi"
        allbeveragesArray.append(detox4)
        
        let detox5 = Beverage()
        detox5.category = detox
        detox5.image = UIImage(named: "sporcuicecegisekersiz")!
        detox5.name = NSLocalizedString( "Zero Sports Drink" , comment: "")
        detox5.waterRate = 98
        detox5.imageName = "sporcuicecegisekersiz"
        allbeveragesArray.append(detox5)
        
        let detox6 = Beverage()
        detox6.category = detox
        detox6.image = UIImage(named: "yesildetoks")!
        detox6.name = NSLocalizedString( "Green Detox" , comment: "")
        detox6.waterRate = 88
        detox6.imageName = "yesildetoks"
        allbeveragesArray.append(detox6)
        
        // Milks
        
        let milk1 = Beverage()
        milk1.category = milk
        milk1.image = UIImage(named: "sut")!
        milk1.name = NSLocalizedString( "Milk" , comment: "")
        milk1.waterRate = 90
        milk1.imageName = "sut"
        allbeveragesArray.append(milk1)
        
        let milk2 = Beverage()
        milk2.category = milk
        milk2.image = UIImage(named: "bademsutu")!
        milk2.name = NSLocalizedString( "Almond Milk" , comment: "")
        milk2.waterRate = 96
        milk2.imageName = "bademsutu"
        allbeveragesArray.append(milk2)
        
        let milk3 = Beverage()
        milk3.category = milk
        milk3.image = UIImage(named: "cikolatalisut")!
        milk3.name = NSLocalizedString( "Chocolate Milk" , comment: "")
        milk3.waterRate = 82
        milk3.imageName = "cikolatalisut"
        allbeveragesArray.append(milk3)
        
        let milk4 = Beverage()
        milk4.category = milk
        milk4.image = UIImage(named: "kajusutu")!
        milk4.name = NSLocalizedString( "Cashew Milk" , comment: "")
        milk4.waterRate = 96
        milk4.imageName = "kajusutu"
        allbeveragesArray.append(milk4)
        
        let milk5 = Beverage()
        milk5.category = milk
        milk5.image = UIImage(named: "laktozsuzsut")!
        milk5.name = NSLocalizedString( "Lactose-Free Milk" , comment: "")
        milk5.waterRate = 88
        milk5.imageName = "laktozsuzsut"
        allbeveragesArray.append(milk5)
        
        let milk6 = Beverage()
        milk6.category = milk
        milk6.image = UIImage(named: "meyvelisut")!
        milk6.name = NSLocalizedString( "Fruity Milk" , comment: "")
        milk6.waterRate = 100
        milk6.imageName = "meyvelisut"
        allbeveragesArray.append(milk6)
        
        let milk7 = Beverage()
        milk7.category = milk
        milk7.image = UIImage(named: "soyasutu")!
        milk7.name = NSLocalizedString( "Soy Milk" , comment: "")
        milk7.waterRate = 93
        milk7.imageName = "soyasutu"
        allbeveragesArray.append(milk7)
        
        let milk8 = Beverage()
        milk8.category = milk
        milk8.image = UIImage(named: "altinsut")!
        milk8.name = NSLocalizedString( "Golden Milk" , comment: "")
        milk8.waterRate = 80
        milk8.imageName = "altinsut"
        allbeveragesArray.append(milk8)
        
        let milk9 = Beverage()
        milk9.category = milk
        milk9.image = UIImage(named: "tamyaglisut")!
        milk9.name = NSLocalizedString( "Butter Milk" , comment: "")
        milk9.waterRate = 88
        milk9.imageName = "tamyaglisut"
        allbeveragesArray.append(milk9)
        
        let milk10 = Beverage()
        milk10.category = milk
        milk10.image = UIImage(named: "yagsizsut")!
        milk10.name = NSLocalizedString( "Skim Milk" , comment: "")
        milk10.waterRate = 90
        milk10.imageName = "yagsizsut"
        allbeveragesArray.append(milk10)
        
        let milk11 = Beverage()
        milk11.category = milk
        milk11.image = UIImage(named: "yarimyaglisut")!
        milk11.name = NSLocalizedString( "Low-fat Milk" , comment: "")
        milk11.waterRate = 89
        milk11.imageName = "yarimyaglisut"
        allbeveragesArray.append(milk11)
        
        let milk12 = Beverage()
        milk12.category = milk
        milk12.image = UIImage(named: "yulafsutu")!
        milk12.name = NSLocalizedString( "Oat Milk" , comment: "")
        milk12.waterRate = 93
        milk12.imageName = "yulafsutu"
        allbeveragesArray.append(milk12)
        
        // Teas
        
        let tea1 = Beverage()
        tea1.category = tea
        tea1.image = UIImage(named: "siyahcay")!
        tea1.name = NSLocalizedString( "Black Tea" , comment: "")
        tea1.waterRate = 98
        tea1.imageName = "siyahcay"
        allbeveragesArray.append(tea1)
        
        let tea2 = Beverage()
        tea2.category = tea
        tea2.image = UIImage(named: "sogukcay")!
        tea2.name = NSLocalizedString( "Iced Tea" , comment: "")
        tea2.waterRate = 90
        tea2.imageName = "sogukcay"
        allbeveragesArray.append(tea2)
        
        let tea3 = Beverage()
        tea3.category = tea
        tea3.image = UIImage(named: "oolongtea")!
        tea3.name = NSLocalizedString( "Oolong Tea" , comment: "")
        tea3.waterRate = 97
        tea3.imageName = "oolongtea"
        allbeveragesArray.append(tea3)
        
        let tea4 = Beverage()
        tea4.category = tea
        tea4.image = UIImage(named: "mate")!
        tea4.name = NSLocalizedString( "Mate" , comment: "")
        tea4.waterRate = 45
        tea4.imageName = "mate"
        allbeveragesArray.append(tea4)
        
        let tea5 = Beverage()
        tea5.category = tea
        tea5.image = UIImage(named: "matcha")!
        tea5.name = NSLocalizedString( "Matcha" , comment: "")
        tea5.waterRate = 90
        tea5.imageName = "matcha"
        allbeveragesArray.append(tea5)
        
        let tea6 = Beverage()
        tea6.category = tea
        tea6.image = UIImage(named: "kombucha")!
        tea6.name = NSLocalizedString( "Kombucha" , comment: "")
        tea6.waterRate = 80
        tea6.imageName = "kombucha"
        allbeveragesArray.append(tea6)
        
        let tea7 = Beverage()
        tea7.category = tea
        tea7.image = UIImage(named: "chaitea")!
        tea7.name = NSLocalizedString( "Chai Tea" , comment: "")
        tea7.waterRate = 86
        tea7.imageName = "chaitea"
        allbeveragesArray.append(tea7)
        
        let tea8 = Beverage()
        tea8.category = tea
        tea8.image = UIImage(named: "bubbletea")!
        tea8.name = NSLocalizedString( "Bubble Tea" , comment: "")
        tea8.waterRate = 60
        tea8.imageName = "bubbletea"
        allbeveragesArray.append(tea8)
        
        let tea9 = Beverage()
        tea9.category = tea
        tea9.image = UIImage(named: "bitkicayi")!
        tea9.name = NSLocalizedString( "Herbal Tea" , comment: "")
        tea9.waterRate = 99
        tea9.imageName = "bitkicayi"
        allbeveragesArray.append(tea9)
        
        // others
        
        let other1 = Beverage()
        other1.category = others
        other1.image = UIImage(named: "kakao")!
        other1.name = NSLocalizedString( "Cacao" , comment: "")
        other1.waterRate = 65
        other1.imageName = "kakao"
        allbeveragesArray.append(other1)
        
        let other2 = Beverage()
        other2.category = others
        other2.image = UIImage(named: "sicakcikolata")!
        other2.name = NSLocalizedString( "Hot Chocolate" , comment: "")
        other2.waterRate = 80
        other2.imageName = "sicakcikolata"
        allbeveragesArray.append(other2)
        
        let other3 = Beverage()
        other3.category = others
        other3.image = UIImage(named: "ayran")!
        other3.name = NSLocalizedString( "Ayran" , comment: "")
        other3.waterRate = 43
        other3.imageName = "ayran"
        allbeveragesArray.append(other3)
        
        let other4 = Beverage()
        other4.category = others
        other4.image = UIImage(named: "kefir")!
        other4.name = NSLocalizedString( "Kefir" , comment: "")
        other4.waterRate = 89
        other4.imageName = "kefir"
        allbeveragesArray.append(other4)
        
        let other5 = Beverage()
        other5.category = others
        other5.image = UIImage(named: "milkshake")!
        other5.name = NSLocalizedString( "Milkshake" , comment: "")
        other5.waterRate = 72
        other5.imageName = "milkshake"
        allbeveragesArray.append(other5)
        
        let other6 = Beverage()
        other6.category = others
        other6.image = UIImage(named: "alkolsuzkokteyl")!
        other6.name = NSLocalizedString( "Mocktail" , comment: "")
        other6.waterRate = 89
        other6.imageName = "alkolsuzkokteyl"
        allbeveragesArray.append(other6)
        
        let other7 = Beverage()
        other7.category = others
        other7.image = UIImage(named: "arpaicecegi")!
        other7.name = NSLocalizedString( "Barley Drink" , comment: "")
        other7.waterRate = 85
        other7.imageName = "arpaicecegi"
        allbeveragesArray.append(other7)
        
        let other8 = Beverage()
        other8.category = others
        other8.image = UIImage(named: "yulaficecegi")!
        other8.name = NSLocalizedString( "Oatmeal Drink" , comment: "")
        other8.waterRate = 76
        other8.imageName = "yulaficecegi"
        allbeveragesArray.append(other8)
        
        let other9 = Beverage()
        other9.category = others
        other9.image = UIImage(named: "pirincicecegi")!
        other9.name = NSLocalizedString( "Rice Drink" , comment: "")
        other9.waterRate = 86
        other9.imageName = "pirincicecegi"
        allbeveragesArray.append(other9)
        
        let other10 = Beverage()
        other10.category = others
        other10.image = UIImage(named: "kvass")!
        other10.name = NSLocalizedString( "Kvass" , comment: "")
        other10.waterRate = 50
        other10.imageName = "kvass"
        allbeveragesArray.append(other10)
        
    }
    
}

class Category{
    var name = ""
    var image = UIImage()
    var ID = ""

}




