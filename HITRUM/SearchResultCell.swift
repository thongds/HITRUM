//
//  SearchResultCell.swift
//  HITRUM
//
//  Created by SSd on 4/30/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class SearchResultCell: BaseCollectionViewCell {
    
    var chooseLocationResult : ChooseLocationResult? {
        
        didSet{
            addressTitle.text = chooseLocationResult?.addressTitle
            addressDetail.text = chooseLocationResult?.addressDetail
        }
    }
    
    let pointImage = UIImageView(image: #imageLiteral(resourceName: "point_ico"))
    let addressTitle = UILabel()
    let addressDetail = UILabel()
    
    override func setupViews() {
        pointImage.translatesAutoresizingMaskIntoConstraints = false
        addressTitle.translatesAutoresizingMaskIntoConstraints = false
        addressDetail.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(pointImage)
        self.contentView.addSubview(addressTitle)
        self.contentView.addSubview(addressDetail)
        
        let views = ["pointImage":pointImage,"addressTitle" : addressTitle,"addressDetail" : addressDetail]
        let metrics = ["pointWidth" : pointImage.frame.width]
        
        pointImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[pointImage(pointWidth)]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[addressTitle]", options: [], metrics: nil, views: views))
         NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[pointImage]-[addressTitle]", options: [], metrics: nil, views: views))
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[addressTitle]-20-[addressDetail]", options: [.alignAllLeading,.alignAllTrailing], metrics: nil, views: views))
       
    }
    
}
