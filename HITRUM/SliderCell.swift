//
//  SliderCell.swift
//  HITRUM
//
//  Created by SSd on 5/5/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class SliderCell: BaseCollectionViewCell {
    
    let topArea = UIView()
    let priceTitle = UILabel()
    let priceContent = UILabel()
    let timeTitle = UILabel()
    let timeContent = UILabel()
    let vipIco : CustomImage = {
        let imageView = CustomImage()
        imageView.image = #imageLiteral(resourceName: "vip_ico")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
//        imageView.layer.borderWidth = 1.0
//        imageView.layer.borderColor = UIColor.white.cgColor
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = CGFloat(90/2)
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let vipTitle = UILabel()
    let vipIcoWidth = 100
    override func setupViews() {
        
        let topAreaHeight = self.contentView.frame.height*128/360
        
        let imageHeight = topAreaHeight * 72/128
        
        topArea.backgroundColor = UIColor.appBaseColor()
       // topArea.frame = CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: topAreaHeight)
        self.contentView.addSubview(topArea)
        
        vipTitle.text = "Gói Vip"
        vipTitle.textColor = UIColor.white
        priceTitle.text = "1. Giá cước"
        priceContent.text = "If you haven’t found relief for migraine, you’re not alone. About 28 million people suffer from the severe, throbbing pain of migraine, which can last from hours to daysthe University of Texas "
        timeTitle.text = "2. Thời gian"
        timeContent.text = "If you haven’t found relief for migraine,you’re not alone.About 28 million people suffer from the.About 28 million people suffer from the .About 28 million people suffer from the .About 28 million people suffer from the.About 28 million people suffer from the.About 28 million people suffer from the.About 28 million people suffer from the.About 28 million people suffer from the.About 28 million people suffer from the.About 28 million people suffer from the"
        
        topArea.translatesAutoresizingMaskIntoConstraints = false
        vipIco.translatesAutoresizingMaskIntoConstraints = false
        vipTitle.translatesAutoresizingMaskIntoConstraints = false
        priceTitle.translatesAutoresizingMaskIntoConstraints = false
        priceContent.translatesAutoresizingMaskIntoConstraints = false
        timeTitle.translatesAutoresizingMaskIntoConstraints = false
        timeContent.translatesAutoresizingMaskIntoConstraints = false

        let topSpaceToCenter = (topAreaHeight - (imageHeight + 10 + 16))/2
        
        self.contentView.addSubview(vipIco)
        self.contentView.addSubview(vipTitle)
        let views = ["topArea" : topArea,"vipIco" :vipIco,"vipTitle" :vipTitle]
        let metrics = ["topAreaHeight" : topAreaHeight,"topSpaceToCenter" : topSpaceToCenter,"imageHeight" :imageHeight]
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[topArea(topAreaHeight)]", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[topArea]|", options: [], metrics: metrics, views: views))
        
        vipIco.centerXAnchor.constraint(equalTo: topArea.centerXAnchor).isActive = true
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-[vipIco(imageHeight)]", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[vipIco(imageHeight)]", options: [], metrics: metrics, views: views))
        vipTitle.centerXAnchor.constraint(equalTo: topArea.centerXAnchor).isActive = true
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[vipIco]-[vipTitle(16)]", options: [], metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(constraints)
        
        
    }
}
