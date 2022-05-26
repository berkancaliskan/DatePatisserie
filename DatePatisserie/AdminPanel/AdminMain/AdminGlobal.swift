//
//  AdminGlobal.swift
//  DatePatisserie
//
//  Created by Tuna Öztürk on 18.05.2022.
//

import Foundation
import Firebase

var arrOrders = [Order]()

func getOrders(){
    
    let db = Firestore.firestore()
    let docRef = db.collection("Orders")
    docRef.getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {

                let documentData = document.data()
                
                
                let order = Order()
                order.totalPrice =  unwrapToDouble(variable: documentData["totalPrice"] as Any)
                order.status =  unwrapToString(variable: documentData["orderStatus"] as Any)
                order.id =  unwrapToString(variable: documentData["id"] as Any)

                let db = Firestore.firestore()
                let docRef = db.collection("Orders").document(order.id).collection("Products")
                docRef.getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {

                            let documentData = document.data()
                            
                            let product = Product()
                            product.name = unwrapToString(variable: documentData["orderStatus"] as Any)
                            product.price = unwrapToFloat(variable: documentData["orderStatus"] as Any)
                            order.products.append(product)
                        }}}
                
                
                arrOrders.append(order)
                
                
            }}}
    
}
