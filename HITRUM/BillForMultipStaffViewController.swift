//
//  BillForMultipStaffViewController.swift
//  HITRUM
//
//  Created by SSd on 5/7/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class BillForMultipStaffViewController: BillForMultipStaffPresent {

    let moneyTotalLabel = UILabel()
    let moneyTotalContent = UILabel()
    
    let staffTotalLabel = UILabel()
    let staffTotalContent = UILabel()
    let viewHeader = UIView()
    
    let billCollectionView = BillForMultipStaffCollectionViewController(collectionViewLayout : BillCollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.tintBackgroundColor()
        viewHeader.backgroundColor = UIColor.white
        initView()
        initConstraintLayout()
    }
    func initView(){
        
        moneyTotalLabel.text = NSLocalizedString("money_total", comment: "")
        moneyTotalLabel.font = UIFont(name: moneyTotalLabel.font.fontName, size: 20)
        staffTotalLabel.text = NSLocalizedString("staff_total", comment: "")
        
        moneyTotalContent.text = "165,000đ"
        moneyTotalContent.font = UIFont(name: moneyTotalContent.font.fontName, size: 20)
        
        staffTotalContent.text = "3"
        
        viewHeader.translatesAutoresizingMaskIntoConstraints = false
        moneyTotalContent.translatesAutoresizingMaskIntoConstraints = false
        staffTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        staffTotalContent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(viewHeader)
        view.addSubview(moneyTotalContent)
        view.addSubview(moneyTotalLabel)
        view.addSubview(staffTotalContent)
        view.addSubview(staffTotalLabel)
        
        ViewHelper.addCollectionViewController(viewController: self, toView: view, collectionView: billCollectionView)
        
    }
    
    func initConstraintLayout(){
    
        let views : [String : Any] = ["viewHeader" :viewHeader,"moneyTotalLabel" :moneyTotalLabel,"staffTotalLabel" :staffTotalLabel,"moneyTotalContent" :moneyTotalContent,"staffTotalContent" :staffTotalContent,"billCollectionView" :billCollectionView.view]
        let metrics = ["headerHeight" : 100]
        
        var constraint = [NSLayoutConstraint]()
        
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[viewHeader(headerHeight)]", options: [], metrics: metrics, views: views))
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[viewHeader]|", options: [], metrics: metrics, views: views))
        
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[moneyTotalLabel]", options: [], metrics: metrics, views: views))
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[moneyTotalLabel]", options: [], metrics: metrics, views: views))
        
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[moneyTotalLabel]-20-[staffTotalLabel]", options: [.alignAllLeading], metrics: metrics, views: views))
        
       
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[moneyTotalContent]-|", options: [], metrics: metrics, views: views))
       moneyTotalContent.lastBaselineAnchor.constraint(equalTo: moneyTotalLabel.lastBaselineAnchor).isActive = true
        
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[staffTotalContent]-|", options: [], metrics: metrics, views: views))
        staffTotalContent.lastBaselineAnchor.constraint(equalTo: staffTotalLabel.lastBaselineAnchor).isActive = true
        
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[viewHeader]-[billCollectionView]-|", options: [], metrics: metrics, views: views))
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[billCollectionView]|", options: [], metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(constraint)
        
    }

    
}























