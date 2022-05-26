//
//  ItemCell.swift
//  Invoice Maker
//
//  Created by Tuna Öztürk on 21.03.2022.
//

import UIKit

class AdminOrderCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var lblProductName = UILabel()
    var lblProductPrice = UILabel()
    var lblBalanceDue = UILabel()
    var lblOrderTime = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(lblProductName)
        addSubview(lblProductPrice)
        addSubview(lblBalanceDue)
        addSubview(lblOrderTime)
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
