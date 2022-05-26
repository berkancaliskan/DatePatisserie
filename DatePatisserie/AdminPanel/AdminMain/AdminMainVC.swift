//
//  AdminMainVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 16.05.2022.
//

import UIKit

class AdminMainVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        createUI()
        
    }
    
    
    func createUI(){
        view.backgroundColor = .white
        
     
        createTableView()
        createButtons()

    }
    
    func createButtons(){
        
        let toDailyMealButton  = UIButton()
        toDailyMealButton.setTitleColor(.white, for: .normal)
        toDailyMealButton.setTitle("Günlük Yemek Gir", for: .normal)
        toDailyMealButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.75 * screenHeight, width: 0.8 * screenWidth, height: 0.08 * screenHeight)
        toDailyMealButton.layer.cornerRadius = 12
        toDailyMealButton.backgroundColor = yesil
        toDailyMealButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 18)
        view.addSubview(toDailyMealButton)
        toDailyMealButton.addTarget(self, action: #selector(toDailyClicked), for: .touchUpInside)
        
        let QRPageButton  = UIButton()
        QRPageButton.setTitleColor(.white, for: .normal)
        QRPageButton.setTitle("QR Sayfasına Git", for: .normal)
        QRPageButton.frame = CGRect(x: 0.1 * screenWidth, y: 0.85 * screenHeight, width: 0.8 * screenWidth, height: 0.08 * screenHeight)
        QRPageButton.layer.cornerRadius = 12
        QRPageButton.backgroundColor = yesil
        QRPageButton.titleLabel?.font = UIFont(name: "Gilroy-Regular", size: 18)
        view.addSubview(QRPageButton)
        QRPageButton.addTarget(self, action: #selector(toQRClicked), for: .touchUpInside)
        
        
    }
    @objc func toDailyClicked() {
        presentVC(currentVC: self, destinationVC: DailyMealVC(), toDirection: .left)
    }
    
    @objc func toQRClicked() {
        presentVC(currentVC: self, destinationVC: AdminQRScanner(), toDirection: .left)
    }
    func createTableView(){
        
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AdminOrderCell.self, forCellReuseIdentifier: "AdminOrderCell")
        tableView.frame = CGRect(x: 0, y: 0.04 * screenHeight, width: screenWidth, height: 0.7 * screenHeight)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOrders.count
    }

  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdminOrderCell", for: indexPath) as! AdminOrderCell
        
        
        print("arrOrders")
        print(arrOrders)
      
        cell.lblProductName.textColor = .black
        cell.lblProductName.text = arrOrders[indexPath.row].products[indexPath.row].name
        cell.lblProductName.numberOfLines = 2
        cell.lblProductName.textAlignment = .left
        cell.lblProductName.font = UIFont(name: "Gilroy-Book", size: 16)
        cell.lblProductName.frame = CGRect(x: 0.05 * screenWidth, y: 10, width: 0.8 * screenWidth, height: 30)
        
        cell.lblProductPrice.textColor = .black
        cell.lblProductPrice.text = "\(arrOrders[indexPath.row].totalPrice)"
        cell.lblProductPrice.numberOfLines = 2
        cell.lblProductPrice.textAlignment = .left
        cell.lblProductPrice.font = UIFont(name: "Gilroy-Book", size: 16)
        cell.lblProductPrice.frame = CGRect(x: 0.05 * screenWidth, y: 40, width: 0.8 * screenWidth, height: 20)
        
        cell.lblBalanceDue.textColor = .black
        cell.lblBalanceDue.text = "\(arrOrders[indexPath.row].status)"
        cell.lblBalanceDue.numberOfLines = 2
        cell.lblBalanceDue.textAlignment = .right
        cell.lblBalanceDue.font = UIFont(name: "Gilroy-Book", size: 16)
        cell.lblBalanceDue.frame = CGRect(x: 0.05 * screenWidth, y: 40, width: 0.9 * screenWidth, height: 20)
       

        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
     
    
    }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 80
  }
  
    
    
    
    
}
