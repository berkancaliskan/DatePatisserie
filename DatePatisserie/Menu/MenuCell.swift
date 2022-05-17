//
//  ProfileCell.swift
//  UICollectionView
//
//  Created by Berkan Çalışkan on 23.02.2022.
//

import UIKit

struct FoodID {
    static var identifier = "sandvic_cell"
}

class MenuCell: UICollectionViewCell {
    
    
    let foodImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let name: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Gilroy-Medium", size: 16)
        label.textColor = lacivert
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Gilroy-Medium", size: 14.5)
        label.textColor = lacivert
        return label
    }()
    
    let professionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.font = UIFont(name: "Gilroy-Medium", size: 16)
        label.textColor = lacivert
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 14
        contentView.backgroundColor = .clear
        
        contentView.addSubview(foodImageView)
        contentView.addSubview(name)
        contentView.addSubview(locationLabel)
        contentView.addSubview(professionLabel)
    }
    
    private func setupLayouts() {
        foodImageView.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        professionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            foodImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            foodImageView.heightAnchor.constraint(equalToConstant: 150.0),
            
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            name.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: -2),
            name.heightAnchor.constraint(equalToConstant: 30),
            
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            locationLabel.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 1),
            locationLabel.heightAnchor.constraint(equalToConstant: 24),
            
            professionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            professionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            professionLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
            professionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with cell: Product) {
        foodImageView.image = cell.image
        name.text = cell.name
        locationLabel.text = "\(cell.price)"
      
    }
}
