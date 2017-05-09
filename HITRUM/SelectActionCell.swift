//
//  SelectActionCell.swift
//  HITRUM
//
//  Created by SSd on 5/9/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class SelectActionCell: BaseCollectionViewCell {
    
    var titleLable = UILabel()
    var checkImage = UIImageView(image: #imageLiteral(resourceName: "checked_ico"))
    
    override func setupViews() {
        titleLable.text = "5 người"
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        checkImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLable)
        contentView.addSubview(checkImage)
        
        titleLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        checkImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        checkImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        checkImage.isHidden = true
    }
    override func prepareForReuse() {
        checkImage.isHidden = true
    }
    
}
