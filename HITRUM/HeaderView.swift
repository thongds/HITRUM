//
//  HeaderView.swift
//  HITRUM
//
//  Created by SSd on 5/7/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    var viewHeader = UIView()
    var billForMultipStaffHeaderLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewHeader = UIView(frame: frame)
        viewHeader.backgroundColor = UIColor.clear
        billForMultipStaffHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        billForMultipStaffHeaderLabel.textColor = UIColor.tintColor()
        billForMultipStaffHeaderLabel.font = UIFont(name: billForMultipStaffHeaderLabel.font.fontName, size: 12)
        billForMultipStaffHeaderLabel.text = NSLocalizedString("bill_for_multip_staff_header", comment: "")
        addSubview(viewHeader)
        viewHeader.addSubview(billForMultipStaffHeaderLabel)
        
        billForMultipStaffHeaderLabel.numberOfLines = 0
        billForMultipStaffHeaderLabel.topAnchor.constraint(equalTo: viewHeader.topAnchor, constant: 10).isActive = true
        billForMultipStaffHeaderLabel.leadingAnchor.constraint(equalTo: viewHeader.leadingAnchor, constant: 10).isActive = true
        billForMultipStaffHeaderLabel.trailingAnchor.constraint(equalTo: viewHeader.trailingAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
