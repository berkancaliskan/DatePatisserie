//
//  beveragesCategories.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 29.01.2022.
//
import UIKit

class beveragesCategories: UICollectionViewCell {
    @IBOutlet weak var CategoriesLabel: UILabel!
    @IBOutlet weak var CategoriesImage: UIImageView!
    @IBOutlet weak var CategoriesSymbols: UIImageView!
    
    
    override var isSelected: Bool {
        
        didSet {
            if isSelected == true {
                
                CategoriesImage.image = UIImage(named: "GroupSelected")
                CategoriesLabel.textColor = .white

            }else if isSelected == false {

                CategoriesImage.image = UIImage(named: "GroupUnselected")
                CategoriesLabel.textColor = .black
 
            }
        }
    }

}
