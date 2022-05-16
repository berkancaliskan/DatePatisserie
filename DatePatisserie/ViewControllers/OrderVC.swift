//
//  OrderVC.swift
//  DatePatisserie
//
//  Created by Berkan Çalışkan on 1.05.2022.
//

import UIKit

class OrderVC: UIViewController {
    
    let orderTableView = UITableView()
    let searchTableView = UITableView()
    let totalPriceLabel = UILabel()
    let confirmOrderButton = UIButton()
    let titleLabel = UILabel()
    var filteredData: [String]!
    
    var frame: CGRect = CGRect(x:0, y:0, width:0, height:0)
    var contentWidth : CGFloat = 0.0
    
    let totalPrice: Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultSize(view: view)
        setUp()
        
    }
    
    func setUp() {
        view.backgroundColor = UIColor.white
        
        let backButton = UIButton()
        backButton.makeBackButton(view: view, selector: #selector(backClicked), VC: self)
        
        orderTableView.frame = CGRect(x: 0.05 * screenWidth, y: 0.14 * screenHeight, width: 0.90 * screenWidth, height:screenHeight * 0.50)
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.backgroundColor = UIColor.clear
        orderTableView.showsVerticalScrollIndicator = false
        orderTableView.rowHeight = 90
        orderTableView.register(OrderCell.self, forCellReuseIdentifier: OrderCell.cell)
        orderTableView.tableFooterView = UIView(frame: .zero)
        orderTableView.reloadData()
        orderTableView.layer.cornerRadius = 12
        view.addSubview(orderTableView)
        
        titleLabel.frame = CGRect(x: 0.2 * screenWidth, y: 0.057 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
        titleLabel.text = "Sipariş Sepeti"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Gilroy-Bold", size: 22)
        titleLabel.textColor = lacivert
        view.addSubview(titleLabel)
        
        totalPriceLabel.frame = CGRect(x: 0.35 * screenWidth, y: 0.68 * screenHeight, width: 0.6 * screenWidth, height: 0.12 * screenWidth)
        totalPriceLabel.backgroundColor = gri
        totalPriceLabel.text = "Toplam Tutar:  ₺\(totalPrice)"
        totalPriceLabel.textAlignment = .center
        totalPriceLabel.textColor = lacivert
        totalPriceLabel.layer.masksToBounds = true
        totalPriceLabel.layer.cornerRadius = 10
        totalPriceLabel.font = UIFont(name: "Gilroy-Bold", size: 20)
        view.addSubview(totalPriceLabel)
        
        confirmOrderButton.frame = CGRect(x: 0.2 * screenWidth, y: 0.8 * screenHeight, width: 0.6 * screenWidth, height: 0.12 * screenWidth)
        confirmOrderButton.setTitle("Siparişi Onayla", for: UIControl.State.normal)
        confirmOrderButton.titleLabel?.font = UIFont(name: "Gilroy-Bold", size: 20)
        confirmOrderButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        confirmOrderButton.backgroundColor = lacivert
        confirmOrderButton.layer.cornerRadius = 13
        view.addSubview(confirmOrderButton)

    }
    
    @objc func backClicked() {
        vibrate(style: .heavy)
        
//        sender ile dismiss eklenecek
        presentVC(currentVC: self, destinationVC: MenuVC(), toDirection: .right)
    }
}
extension OrderVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.cell, for: indexPath) as! OrderCell
            cell.backgroundColor = krem
            cell.layer.cornerRadius = 14
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("\(indexPath.row) Clicked.")
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        let verticalPadding: CGFloat = 12
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 10    //if you want round edges
        maskLayer.backgroundColor = UIColor.red.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
}
