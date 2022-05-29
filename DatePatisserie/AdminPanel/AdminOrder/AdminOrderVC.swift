//
//  AdminOrderVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 28.05.2022.
//

import UIKit

class AdminOrderVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        view.backgroundColor = .white
        createHeaderUI()
        createTableView()
    }
    
    func createHeaderUI(){
        
    
    let backButton = UIButton()
    backButton.setBackgroundImage(UIImage(named: "back_btn"), for: UIControl.State.normal)
    backButton.frame = CGRect(x: 0.054 * screenWidth, y: 0.057 * screenHeight, width: 0.08 * screenWidth, height: 0.08 * screenWidth)
    backButton.contentVerticalAlignment.self = .center
    backButton.contentHorizontalAlignment.self = .center
    view.addSubview(backButton)
    backButton.addTarget(self, action: #selector(backClicked), for: UIControl.Event.touchUpInside)
    
    let title = UILabel()
    title.frame = CGRect(x: 0.2 * screenWidth, y: 0.057 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
    title.text = "Gelen Siparişler"
    title.textAlignment = .center
    title.font = UIFont(name: "Gilroy-Bold", size: 22)
    title.textColor = lacivert
    view.addSubview(title)
    
    }
    
    
    func createTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AdminOrderCell.self, forCellReuseIdentifier: "AdminOrderCell")
        tableView.frame = CGRect(x: 0.01 * screenWidth, y: 0.15 * screenHeight, width: 0.98 * screenWidth, height: 0.7 * screenHeight)
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        view.addSubview(tableView)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5//arrOrders.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdminOrderCell", for: indexPath) as! AdminOrderCell
        
        setDefaultSize(view: view)
        print("arrOrders")
        print(arrOrders)
        
        cell.backgroundColor = krem
        cell.layer.cornerRadius = 12
        
        cell.lblProductName.textColor = lacivert
        cell.lblProductName.text = "Balık"//arrOrders[indexPath.row].products[indexPath.row].name
        cell.lblProductName.numberOfLines = 0
        cell.lblProductName.textAlignment = .left
        cell.lblProductName.font = UIFont(name: "Gilroy-Regular", size: 16)
        cell.lblProductName.frame = CGRect(x: 0.05 * screenWidth, y: 10, width: 0.8 * screenWidth, height: 30)
        
        cell.lblProductPrice.textColor = lacivert
        cell.lblProductPrice.text = "₺140"//"\(arrOrders[indexPath.row].totalPrice)"
        cell.lblProductPrice.numberOfLines = 0
        cell.lblProductPrice.textAlignment = .left
        cell.lblProductPrice.font = UIFont(name: "Gilroy-Regular", size: 16)
        cell.lblProductPrice.frame = CGRect(x: 0.05 * screenWidth, y: 40, width: 0.8 * screenWidth, height: 20)
        
        cell.lblBalanceDue.textColor = lacivert
        cell.lblBalanceDue.text = "234"//"\(arrOrders[indexPath.row].status)"
        cell.lblBalanceDue.numberOfLines = 0
        cell.lblBalanceDue.textAlignment = .right
        cell.lblBalanceDue.font = UIFont(name: "Gilroy-Regular", size: 16)
        cell.lblBalanceDue.frame = CGRect(x: 0.75 * screenWidth, y: 40, width: 0.1 * screenWidth, height: 20)
        
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy"
        let dateString = df.string(from: date)
        
        
        cell.lblOrderTime.textColor = lacivert
        cell.lblOrderTime.text = dateString//"\(arrOrders[indexPath.row].status)"
        cell.lblOrderTime.numberOfLines = 0
        cell.lblOrderTime.textAlignment = .right
        cell.lblOrderTime.font = UIFont(name: "Gilroy-Regular", size: 12)
        cell.lblOrderTime.frame = CGRect(x: 0.25 * screenWidth, y: 40, width: 0.3 * screenWidth, height: 20)
        

        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 12
        maskLayer.backgroundColor = krem.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: 4)
        cell.layer.mask = maskLayer
        
    }
    
    
    @objc func backClicked() {
        
        presentVC(currentVC: self, destinationVC: AdminMainVC(), toDirection: .left)
        
    }
    
    
    
    
}
