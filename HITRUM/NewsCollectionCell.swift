//
//  NewsCollectionCellCollectionViewCell.swift
//  HITRUM
//
//  Created by SSd on 4/27/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class NewsCollectionCell: BaseCollectionViewCell {
    
    var newsModel : NewsModel? {
        didSet{
            loadDataSource()
        }
    }
    
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let contentLabel = UILabel()
    
    func loadDataSource(){
        titleLabel.text = newsModel?.title
        dateLabel.text = newsModel?.date
        contentLabel.text = newsModel?.content
    }
    
    override func setupViews(){
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.textColor = UIColor.tintColor()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.textColor = UIColor.tintColor()
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(contentLabel)
        
        let views  = ["titleLabel" : titleLabel,"dateLabel" : dateLabel,"contentLabel" : contentLabel]
        let metrics = ["dateLabelWidth" : 100]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[dateLabel]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[titleLabel]-[dateLabel(dateLabelWidth)]-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[dateLabel]-[contentLabel]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[contentLabel]-|", options: [], metrics: metrics, views: views))
        
    }
    
}
