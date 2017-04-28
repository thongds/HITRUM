//
//  HistoryCellCollectionViewCell.swift
//  HITRUM
//
//  Created by SSd on 4/27/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class HistoryCellCollectionViewCell: BaseCollectionViewCell {
    
    let codeLabel = UILabel()
    let priceLabel = UILabel()
    let addressLabel = UILabel()
    let addressContent = UILabel()
    let timeLabel = UILabel()
    let timeContent = UILabel()
    let timeTotalLabel = UILabel()
    let timeTotal = UILabel()
    let nextRowImage = UIImageView(image: #imageLiteral(resourceName: "next_row_ico"))
    override func setupViews() {
        initViewData()
        addViewContraint()
    }
    
    func initViewData(){
        addressLabel.text = NSLocalizedString("history_address", comment: "")
        timeLabel.text = NSLocalizedString("history_time", comment: "")
        timeTotalLabel.text = NSLocalizedString("history_time_total", comment: "")
        codeLabel.text = "ADSFSDS"
        
        priceLabel.text = "350.000đ"
        priceLabel.textColor = UIColor.appBaseColor()
        addressContent.text = "123/2A Lê Lợi, P.5, Q.1"
        timeContent.text = "14:30 24/04/2017"
        timeTotal.text = "2 giờ"
    }
    
    func addViewContraint(){
        codeLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressContent.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeContent.translatesAutoresizingMaskIntoConstraints = false
        timeTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        timeTotal.translatesAutoresizingMaskIntoConstraints = false
        nextRowImage.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(codeLabel)
        addSubview(addressLabel)
        addSubview(timeLabel)
        addSubview(timeTotalLabel)
        
        addSubview(priceLabel)
        addSubview(addressContent)
        addSubview(timeContent)
        addSubview(timeTotal)
        
        let views = ["codeLabel":codeLabel,"priceLabel":priceLabel,"addressLabel":addressLabel,"addressContent":addressContent,"timeLabel":timeLabel,"timeContent":timeContent,"timeTotalLabel":timeTotalLabel,"timeTotal":timeTotal,"nextRowImage" : nextRowImage]
        let metrics = ["leftWidth" : 100]
        
        var contraints = [NSLayoutConstraint]()
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-[codeLabel]", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[codeLabel]", options: [], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-[priceLabel]", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[priceLabel]-|", options: [], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[codeLabel]-20-[addressLabel]", options: [.alignAllTrailing], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[addressLabel(leftWidth)]", options: [], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[addressLabel]-[timeLabel]", options: [.alignAllTrailing,.alignAllLeading], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[timeLabel]-[timeTotalLabel]", options: [.alignAllTrailing,.alignAllLeading], metrics: metrics, views: views))
        
        //left
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[addressLabel]-[addressContent]", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[timeLabel]-[timeContent]", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[timeTotalLabel]-[timeTotal]", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        
        
        NSLayoutConstraint.activate(contraints)
    }
    
}



















