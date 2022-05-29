//
//  Globals.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 17.05.2022.
//

import Foundation
import UIKit



var arrProducts  = [Product]()
var cartProducts = [CartObject]()

let uDefaults = UserDefaults.standard


func unwrapToString(variable : Any) -> String{
    
    if let unwrapped = variable as? String{
        return unwrapped
    }else{
        return ""
    }
}

func unwrapToFloat(variable : Any) -> Float{
    
    if let unwrapped = variable as? Float{
        return unwrapped
    }else{
        return Float()
    }
}

func unwrapToDouble(variable : Any) -> Double{
    
    if let unwrapped = variable as? Double{
        return unwrapped
    }else{
        return 0.0
    }
}

func unwrapToInt(variable : Any) -> Int{
    
    if let unwrapped = variable as? Int{
        return unwrapped
    }else{
        return 0
    }
}
func unwrapToImage(variable : Any) -> UIImage{
    
    if let unwrapped = variable as? UIImage{
        return unwrapped
    }else{
        return UIImage()
    }
}
