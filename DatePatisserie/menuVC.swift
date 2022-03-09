//
//  MenuVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 29.01.2022.
//

import UIKit

class menuVC: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var beveragesCollection: UICollectionView!
    
    @IBOutlet weak var CategoriesCollection: UICollectionView!
    

    var selectedCategoryIndex = IndexPath()
    var choosenBeverage = Beverage()
    
    var isUserPremium = true
  

    override func viewDidLoad() {
        
        view.backgroundColor = .white
            
        allbeveragesArray.removeAll()
        Beverage().setMenu()
        
        let screenHeight = view.frame.size.height
        let screenWidth = view.frame.size.width
        let stringMultiplier = 0.00115 * screenHeight
        
 
        let mainTitle = UILabel()
            mainTitle.text = NSLocalizedString("Date Patisserie", comment: "")
            mainTitle.textAlignment = .center
            mainTitle.textColor = koyuYesil
            mainTitle.numberOfLines = 0
            mainTitle.font = UIFont(name: "Gilroy-Bold", size: 22 * stringMultiplier)
            mainTitle.frame = CGRect(x: 0.2 * screenWidth, y: 0.056 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(mainTitle)


        let backButton = UIButton()
        backButton.setBackgroundImage(UIImage(named: "back_btn"), for: UIControl.State.normal)
        backButton.frame = CGRect(x: 0.04 * screenWidth, y: 0.07 * screenHeight, width: 0.06 * screenWidth, height: 0.024 * screenHeight)
        backButton.contentVerticalAlignment.self = .center
        backButton.contentHorizontalAlignment.self = .center
                    view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backClicked), for: UIControl.Event.touchUpInside)
            

        
        beveragesCollection!.frame = CGRect(x: 0, y: 0.3 * screenHeight , width: screenWidth, height: 0.7 * screenHeight)
        view.addSubview(beveragesCollection!)
        beveragesCollection.showsVerticalScrollIndicator = false
        beveragesCollection.showsHorizontalScrollIndicator = false
        beveragesCollection?.dataSource = self
        beveragesCollection?.delegate = self
        beveragesCollection.backgroundColor = .white

        CategoriesCollection!.frame = CGRect(x: 0, y: 0.12 * screenHeight , width: screenWidth, height: 0.3 * screenHeight)
        view.addSubview(beveragesCollection!)
        CategoriesCollection.showsVerticalScrollIndicator = false
        CategoriesCollection.showsHorizontalScrollIndicator = false
        CategoriesCollection?.dataSource = self
        CategoriesCollection?.delegate = self
        CategoriesCollection.backgroundColor = .white
        CategoriesCollection.allowsMultipleSelection = false
        
        
            
            selectedCategoryIndex = [0,0]
           
            beverageArray.removeAll()
            
            CategoriesCollection.reloadData()
         
             
                for beverage in allbeveragesArray{
                  
                    if beverage.category.ID == "water"{
                        
                        beverageArray.append(beverage)
                    }
                    
                }
                
           
            
            
            beveragesCollection.scrollToItem(at: [0,0], at: .top, animated: true)
        
    }
    
    
    // Her Cell'de ne olacağını belirler.

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
            let myCell = beveragesCollection.dequeueReusableCell(withReuseIdentifier: "beveragesCell", for: indexPath) as! beveragesCell
            
            let screenHeight = view.frame.size.height
            let screenWidth = view.frame.size.width
            let stringMultiplier = 0.00115 * screenHeight
            
            

            if collectionView == CategoriesCollection{
                let CategoriesCell = CategoriesCollection.dequeueReusableCell(withReuseIdentifier: "beveragesCategories", for: indexPath) as! beveragesCategories
                CategoriesCell.CategoriesImage.frame = CGRect(x: -0.15 * screenWidth, y: 0.0002 * screenHeight, width: 0.6 * screenWidth, height: 0.2 * screenHeight)
              
                CategoriesCell.CategoriesLabel.text = categoryArray[indexPath.row].name
                CategoriesCell.CategoriesLabel.textAlignment = .center
                CategoriesCell.CategoriesLabel.frame = CGRect(x: -0.118 * screenWidth, y: -0.077 * screenHeight , width: 0.485 * screenWidth, height: 0.29 * 2.16 * screenWidth)
                CategoriesCell.CategoriesLabel.font = UIFont(name: "Gilroy-Regular", size: 14 * stringMultiplier)
                
                
                if indexPath == selectedCategoryIndex {
                    
                    CategoriesCell.isSelected = true
                     
            }else {
                    
                    CategoriesCell.isSelected = false
                    
            }
                
                CategoriesCell.CategoriesSymbols.image = categoryArray[indexPath.row].image
                CategoriesCell.CategoriesSymbols.frame = CGRect(x: 0.1 * screenWidth, y: 0.1 * screenHeight, width: 0.07729468599033816 * screenWidth, height: 0.03571428571428571 * screenHeight)
              return CategoriesCell
        }
            
            else if collectionView == beveragesCollection{
     
                let myCell = beveragesCollection.dequeueReusableCell(withReuseIdentifier: "beveragesCell", for: indexPath) as! beveragesCell
                
                myCell.background.image = UIImage(named: "BeveragesCollectionCellBg")
                
                if indexPath.row % 2 == 0 {
                myCell.background.frame = CGRect(x: 0.02 * screenWidth, y: 0, width: 0.485 * screenWidth, height: 0.29 * 2.16 * screenWidth)
                myCell.beverageImage.frame = CGRect(x: 0.1125 * screenWidth, y: 0.025 * screenHeight , width: 0.3 * screenWidth, height: 0.3 * screenWidth)
                myCell.beverageNameLabel.frame = CGRect(x: 0.11 * screenWidth, y: 0.04 * screenHeight, width: 0.485 * screenWidth, height: 0.29 * 2.16 * screenWidth)
                myCell.waterRateLabel.frame = CGRect(x: 0.009 * screenWidth, y: 0.09 * screenHeight , width: 0.485 * screenWidth, height: 0.29 * 2.16 * screenWidth)
                myCell.premiumFrontColor.frame = CGRect(x: 0.02 * screenWidth, y: 0, width: 0.485 * screenWidth, height: 0.29 * 2.16 * screenWidth)
                    
            }else{
                    
                myCell.background.frame = CGRect(x: -0.02 * screenWidth, y: 0, width: 0.485 * screenWidth, height: 0.29 * 2.16 * screenWidth)
                myCell.beverageImage.frame = CGRect(x: 0.0725   * screenWidth, y: 0.025 * screenHeight , width: 0.3 * screenWidth, height: 0.3 * screenWidth)
                myCell.beverageNameLabel.frame = CGRect(x: 0.09 * screenWidth, y: 0.04 * screenHeight , width: 0.485 * screenWidth, height: 0.29 * 2.16 * screenWidth)
                myCell.waterRateLabel.frame = CGRect(x: -0.02 * screenWidth, y: 0.09 * screenHeight , width: 0.485 * screenWidth, height: 0.29 * 2.16 * screenWidth)
                myCell.premiumFrontColor.frame = CGRect(x: -0.02 * screenWidth, y: 0, width: 0.485 * screenWidth, height: 0.29 * 2.16 * screenWidth)
                    
            }
               
                
                myCell.beverageImage.image = beverageArray[indexPath.row].image
                myCell.beverageNameLabel.text = beverageArray[indexPath.row].name
                myCell.beverageNameLabel.textAlignment = .left
                myCell.beverageNameLabel.font = UIFont(name: "Gilroy", size: 16)
                myCell.beverageNameLabel.textColor = .black
                
                myCell.waterRateLabel.text = "%\(beverageArray[indexPath.row].waterRate)"
                myCell.waterRateLabel.textAlignment = .center
                myCell.waterRateLabel.font = UIFont(name: "Gilroy", size: 16)
                myCell.waterRateLabel.textColor = .black
                myCell.premiumFrontColor.image = UIImage(named: "beveragePremium")
                
              return myCell
            }
            
            return myCell
        }
        
    // Belirli bir cell'e tıklandığında olacakları belirler.

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        CategoriesCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        if collectionView == beveragesCollection{
            
            choosenBeverage.image = beverageArray[indexPath.row].image
            choosenBeverage.name = beverageArray[indexPath.row].name
            choosenBeverage.category = beverageArray[indexPath.row].category
            choosenBeverage.waterRate = beverageArray[indexPath.row].waterRate
            choosenBeverage.imageName = beverageArray[indexPath.row].imageName
            performSegue(withIdentifier: "menuToDetail", sender: nil )
            
            
    }else if collectionView == CategoriesCollection{
            
            selectedCategoryIndex = indexPath
         
            beverageArray.removeAll()
            CategoriesCollection.reloadData()
            beveragesCollection.reloadData()
            
            
        switch indexPath.row {
        case 0:
                
             
                for beverage in allbeveragesArray{
                  
                    if beverage.category.ID == "water"{
                        
                        beverageArray.append(beverage)
                        beveragesCollection.reloadData()
                    }
                    
                }
                
            case 1:
                
                for beverage in allbeveragesArray{
                  
                    if beverage.category.ID == "soda"{
                        
                        beverageArray.append(beverage)
                        beveragesCollection.reloadData()
                    }
                    
                }
                
            case 2:
                
             
                
                for beverage in allbeveragesArray{
                  
                    if beverage.category.ID == "coffee"{
                        
                        beverageArray.append(beverage)
                        beveragesCollection.reloadData()
                    }
                    
                }
                
            case 3:
                
                for beverage in allbeveragesArray{
                  
                    if beverage.category.ID == "alcohol"{
                        
                        beverageArray.append(beverage)
                        beveragesCollection.reloadData()
                    }
                    
                }
            case 4:
                
                for beverage in allbeveragesArray{
                    if beverage.category.ID == "milk" {
                        
                        beverageArray.append(beverage)
                        beveragesCollection.reloadData()
                    }
                }
            case 5:
                
                for beverage in allbeveragesArray{
                    if beverage.category.ID == "tea" {
                        
                        beverageArray.append(beverage)
                        beveragesCollection.reloadData()
                    }
                }
            case 6:
                
                for beverage in allbeveragesArray{
                    if beverage.category.ID == "juice" {
                        
                        beverageArray.append(beverage)
                        beveragesCollection.reloadData()
                    }
                }
            case 7:
                
                for beverage in allbeveragesArray{
                    if beverage.category.ID == "detoks" {
                        
                        beverageArray.append(beverage)
                        beveragesCollection.reloadData()
                    }
                }
            case 8:
                
                for beverage in allbeveragesArray{
                    if beverage.category.ID == "others" {
                        
                        beverageArray.append(beverage)
                        beveragesCollection.reloadData()
                    }
                }
            default:
                print("")
            }
            
            beveragesCollection.scrollToItem(at: [0,0], at: .top, animated: true)
        }
            
   

    }

    // Cell sayısını belirler

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collectionView == beveragesCollection {
                return beverageArray.count
                }

            return categoryArray.count
            }
               
    
    // Cell'in en ve boyunu belirler.

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
    let screenWidth = view.frame.size.width
    let screenHeight = view.frame.size.height
     
       var cellsSize = CGSize()
        
        if collectionView == beveragesCollection{
            
            cellsSize =  CGSize(width: 0.485 * screenWidth , height:  0.29 * 2.16 * screenWidth)
            
        }else if collectionView == CategoriesCollection{
            
            cellsSize =  CGSize(width: 0.26 * screenWidth , height:  0.29 * 2.16 * screenWidth)
            
        }
        
        return cellsSize
   
    }
    
    
    @objc func backClicked() {
        vibrate(style: .heavy)
        performSegue(withIdentifier: "menuToMain", sender: nil)
    
    }
   
    
}
    

    
