//
//  ViewController.swift
//  HorizontalScrollMenu
//
//  Created by Admin on 04/10/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

class FoodMenuVC: UIViewController, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let shoppingCartView = UIView()
    let productCounterLabel = UILabel()
    var numberOfProduct: Int = 4
    var productCounterLabelisHidden: Bool = false

    
    
    var scrollview = UIScrollView()
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    let button6 = UIButton()
    
    
    let space: CGFloat = 20.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setDefaultSize(view: self.view)
        setupViews()
        createHeaderView()
        createScrollView()
        createScrollButtons()
        buttonAddSubview()
        setupLayouts()
        createSandwiches()
        collectionView.reloadData()

        
    }
    
    func createHeaderView(){
        
        let backButton = UIButton()
        backButton.setBackgroundImage(UIImage(named: "back_btn"), for: UIControl.State.normal)
        backButton.frame = CGRect(x: 0.04 * screenWidth, y: 0.07 * screenHeight, width: 0.06 * screenWidth, height: 0.024 * screenHeight)
        view.addSubview(backButton)
        backButton.layer.masksToBounds = false
        backButton.contentMode = .scaleAspectFit
        backButton.addTarget(self, action: #selector(backClicked), for: UIControl.Event.touchUpInside)
        
        let mainTitle = UILabel()
        mainTitle.text = NSLocalizedString("Date Patisserie", comment: "")
        mainTitle.textAlignment = .center
        mainTitle.textColor = lacivert
        mainTitle.numberOfLines = 0
        mainTitle.font = UIFont(name: "Gilroy-Bold", size: 22 * stringMultiplier)
        mainTitle.frame = CGRect(x: 0.2 * screenWidth, y: 0.056 * screenHeight, width: 0.6 * screenWidth, height: 0.05 * screenHeight)
        view.addSubview(mainTitle)
        
        createShoppingCardView()
        
        
        
    }
    
    func createShoppingCardView(){
        
        
        shoppingCartView.frame = CGRect(x: 0.83 * screenWidth, y: 0.056 * screenHeight, width: 0.05 * screenHeight, height: 0.05 * screenHeight)
        shoppingCartView.backgroundColor = .clear
        view.addSubview(shoppingCartView)
        
        
        let cartButton = UIButton()
        cartButton.setBackgroundImage(UIImage(named: "cart"), for: UIControl.State.normal)
        cartButton.frame = CGRect(x: 0, y: 12, width: 30, height: 30)
        shoppingCartView.addSubview(cartButton)
        cartButton.layer.masksToBounds = true
        cartButton.contentMode = .scaleAspectFit
        cartButton.addTarget(self, action: #selector(backClicked), for: UIControl.Event.touchUpInside)
        
        productCounterLabel.frame = CGRect(x: cartButton.frame.maxX - 12, y: 0, width: 26, height: 26)
        productCounterLabel.text = String(numberOfProduct)
        productCounterLabel.textAlignment = .center
        productCounterLabel.textColor = lacivert
        productCounterLabel.font = UIFont(name: "Gilroy-Medium", size: 14)
        productCounterLabel.backgroundColor = UIColor(hexCode: "F0E1CF")
        productCounterLabel.layer.masksToBounds = true
        productCounterLabel.layer.cornerRadius = productCounterLabel.frame.width/2
        productCounterLabel.isHidden = productCounterLabelisHidden
        shoppingCartView.addSubview(productCounterLabel)
        
        
    }
    
    func createScrollView(){
        scrollview.frame = CGRect(x: 0, y: screenHeight * 0.14, width: screenWidth, height: screenHeight * 0.11)
        scrollview.contentSize = CGSize(width: screenWidth * 1.585, height: screenHeight * 0.1)
        scrollview.alwaysBounceHorizontal = true
        scrollview.delegate = self
        scrollview.backgroundColor = .clear
        
    }
    
    func buttonAddSubview(){
        
        self.scrollview.addSubview(button1)
        self.scrollview.addSubview(button2)
        self.scrollview.addSubview(button3)
        self.scrollview.addSubview(button4)
        self.scrollview.addSubview(button5)
        self.scrollview.addSubview(button6)
    }
    
    func createScrollButtons(){
        
        button1.frame = CGRect(x: 16,y: 5,width: screenHeight * 0.1,height: screenHeight * 0.1)
        button1.makeCustomButton(title: "Sandviç", icon: UIImage(named: "sandvic_icon")!)
        button1.addTarget(self, action: #selector(button1Clicked), for:UIControl.Event.touchUpInside)
        
        button2.frame = CGRect(x: button1.frame.maxX + 18,y: 5,width: screenHeight * 0.1,height: screenHeight * 0.1)
        button2.makeCustomButton(title: "Tost", icon: UIImage(named: "pizza_icon")!)
        button2.addTarget(self, action: #selector(button2Clicked), for:UIControl.Event.touchUpInside)
        
        button3.frame = CGRect(x: button2.frame.maxX + 18,y: 5,width: screenHeight * 0.1,height: screenHeight * 0.1)
        button3.makeCustomButton(title: "Burger", icon: UIImage(named: "burger_icon")!)
        button3.addTarget(self, action: #selector(button3Clicked), for:UIControl.Event.touchUpInside)
        
        button4.frame = CGRect(x: button3.frame.maxX + 18,y: 5,width: screenHeight * 0.1,height: screenHeight * 0.1)
        button4.makeCustomButton(title: "Pizza", icon: UIImage(named: "burger_icon")!)
        button4.addTarget(self, action: #selector(button4Clicked), for:UIControl.Event.touchUpInside)
        
        button5.frame = CGRect(x: button4.frame.maxX + 18,y: 5,width: screenHeight * 0.1,height: screenHeight * 0.1)
        button5.makeCustomButton(title: "Tatlı", icon: UIImage(named: "burger_icon")!)
        button5.addTarget(self, action: #selector(button5Clicked), for:UIControl.Event.touchUpInside)
        
        button6.frame = CGRect(x: button5.frame.maxX + 18,y: 5,width: screenHeight * 0.1,height: screenHeight * 0.1)
        button6.makeCustomButton(title: "Diğer", icon: UIImage(named: "burger_icon")!)
        button6.addTarget(self, action: #selector(button6Clicked), for:UIControl.Event.touchUpInside)
        
        view.addSubview(scrollview)
        
    }
    
    func deactiveAllButton(){
        
        button1.deactiveButton()
        button2.deactiveButton()
        button3.deactiveButton()
        button4.deactiveButton()
        button5.deactiveButton()
        button6.deactiveButton()
        
    }
    
//    CollectionView oluşturuyoruz.
        let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()

//   Cellerin kaç tane olacağını profile boyuna göre belirliyoruz.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sandwiches.count
    }
    
//   Cellere tıkladığımda ne olacağını yazıyoruz.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        vibrate(style: .heavy)
    
        showCustomAlert(title: "Merhaba!" , message: "Seçilen item \(indexPath.row)", viewController: self)
    
    }
//   Cellere içeriğinde ne olacağını yazıyoruz.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodID.identifier, for: indexPath) as! SandvicCell

        let profile = sandwiches[indexPath.row]
        cell.setup(with: profile)
        cell.contentView.backgroundColor = .white
        cell.contentView.layer.borderWidth = 0
        cell.contentView.layer.borderColor = UIColor.gray.cgColor
        cell.contentView.layer.shadowColor = UIColor.gray.cgColor
        cell.contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.contentView.layer.shadowRadius = 6.0
        cell.contentView.layer.shadowOpacity = 0.4
        cell.contentView.layer.masksToBounds = false
        return cell
    }
    
    
//   Cellerin boyutlarını belirliyoruz.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = itemWidth(for: view.frame.width, spacing: space)

        return CGSize(width: width, height: 250)
    }

//    İtemlerin arasındaki boşluğu ve itemlerin width'i belirten fonksiyon.
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2

        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow

        return floor(finalWidth)
    }
//    İtemlerin view içindeki görünümü yani alttan üstten ve yanlardan uzaklığını veren fonksiyon.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16.0,
                            left: space,
                            bottom: 266,
                            right: space)
    }




   func setupViews() {
        
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SandvicCell.self, forCellWithReuseIdentifier: FoodID.identifier)
    }

     func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.frame = CGRect(x: 0,
                                      y: 0.28 * screenHeight,
                                      width: screenWidth ,
                                      height: screenHeight)
    
    }

    @objc  func button1Clicked(){
        
        print("button 1 clicked")
        deactiveAllButton()
        button1.activeButton()
    }
    @objc  func button2Clicked(){
        
        print("button 2 clicked")
        deactiveAllButton()
        button2.activeButton()
    }
    @objc  func button3Clicked(){
        
        print("button 3 clicked")
        deactiveAllButton()
        button3.activeButton()
    }
    @objc  func button4Clicked(){
        
        print("button 4 clicked")
        deactiveAllButton()
        button4.activeButton()
    }
    @objc  func button5Clicked(){
        
        print("button 5 clicked")
        deactiveAllButton()
        button5.activeButton()
    }
    @objc  func button6Clicked(){
        
        print("button 6 clicked")
        deactiveAllButton()
        button6.activeButton()
    }
    
    @objc  func backClicked(){
        
        dismiss(animated: true)
    }
    
}



extension UIButton{
    
    
    func makeCustomButton(title : String, icon: UIImage){
        
        
        self.backgroundColor = UIColor(hexCode: "F0E1CF")
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = self.frame.width * 0.5
        self.titleLabel?.text = title
        self.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 12 * stringMultiplier)
        self.contentHorizontalAlignment.self = .center
        
        let imageW = self.frame.width * 0.6
        let iconW = self.frame.width
        let iconView = UIImageView()
        iconView.image = icon
        iconView.frame = CGRect(x: (iconW - imageW) * 0.5 , y: 12, width: imageW , height: imageW)
        self.addSubview(iconView)
        iconView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        
        let iconNameLabel = UILabel()
        iconNameLabel.frame = CGRect(x: 0, y: self.frame.midY + 15, width: self.frame.width , height: self.frame.height * 0.1)
        iconNameLabel.font = UIFont(name: "Gilroy-Medium", size: 12 * stringMultiplier)
        iconNameLabel.textColor = UIColor(hexCode: "383856")
        iconNameLabel.text = title
        iconNameLabel.textAlignment = .center
        self.addSubview(iconNameLabel)
    }
    
    func activeButton(){
        
        self.layer.borderColor = UIColor(hexCode: "BAD65D").cgColor
        self.layer.borderWidth = 4
        
    }
    
    func deactiveButton(){
        
        self.layer.borderWidth = 0
        
    }
    
}
