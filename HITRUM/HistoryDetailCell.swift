//
//  HistoryDetailCell.swift
//  HITRUM
//
//  Created by SSd on 4/28/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class HistoryDetailCell: BaseCollectionViewCell {

    let avatarWidthPercent : CGFloat = 48/296
    var avatarWidth : CGFloat = 0
    var historyDetailModel : HistoryDetailModel? {
        didSet{
            loadModelData()
        }
    }
    let avatar : CustomImage = {
        let imageView = CustomImage()
        imageView.image = #imageLiteral(resourceName: "default_image")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel = UILabel()
    let timeStartLabel = UILabel()
    let timeStartContent = UILabel()
    let timeEndLabel = UILabel()
    let timeEndContent = UILabel()
    let priceLabel = UILabel()
    
    override func setupViews() {
        //avatarWidth = self.contentView.frame.width * avatarWidthPercent
        avatarWidth = 60
        avatar.layer.cornerRadius = CGFloat(avatarWidth/2)

        initViewData()
        addConstraint()
    }
    
    func loadModelData(){
        nameLabel.text = historyDetailModel?.userName
        priceLabel.text = historyDetailModel?.price
        timeStartContent.text = historyDetailModel?.timeStart
        timeEndContent.text = historyDetailModel?.timeEnd
    }
    
    func initViewData(){
        avatar.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont(name: nameLabel.font.fontName, size: 16)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont(name: priceLabel.font.fontName, size: 16)
        priceLabel.textAlignment = .right
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timeStartLabel.text = NSLocalizedString("time_start", comment: "")
        timeStartLabel.translatesAutoresizingMaskIntoConstraints = false
        timeStartLabel.font = UIFont(name: timeStartLabel.font.fontName, size: 12)
        timeStartContent.translatesAutoresizingMaskIntoConstraints = false
        timeStartContent.font = UIFont(name: timeStartContent.font.fontName, size: 12)
        
        timeEndLabel.text = NSLocalizedString("time_end", comment: "")
        timeEndLabel.translatesAutoresizingMaskIntoConstraints = false
        timeEndLabel.font = UIFont(name: timeEndLabel.font.fontName, size: 12)
        timeEndLabel.textAlignment = .right
        timeEndContent.translatesAutoresizingMaskIntoConstraints = false
        timeEndContent.font = UIFont(name: timeEndContent.font.fontName, size: 12)
        timeEndContent.textAlignment = .right
        self.contentView.addSubview(avatar)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(timeStartLabel)
        self.contentView.addSubview(timeStartContent)
        self.contentView.addSubview(timeEndContent)
        self.contentView.addSubview(timeEndLabel)
    }
    
    func addConstraint(){
        var constraints = [NSLayoutConstraint]()
        let leftWidth = (self.contentView.frame.width-CGFloat(avatarWidth)-CGFloat(40))/2
        let views = ["avatar": avatar,"nameLabel" :nameLabel, "priceLabel" : priceLabel, "timeStartLabel" :timeStartLabel, "timeStartContent" :timeStartContent,"timeEndContent" :timeEndContent,"timeEndLabel" :timeEndLabel]
        let metrics : [String : Any] = ["avatarWidth" : avatarWidth ,"leftWidth" : leftWidth]
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[avatar(avatarWidth)]", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[avatar(avatarWidth)]", options: [], metrics: metrics, views: views))
        avatar.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10).isActive = true
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[nameLabel(leftWidth)]", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[nameLabel]-[priceLabel]-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        
        timeStartLabel.bottomAnchor.constraint(equalTo: avatar.bottomAnchor, constant: -10).isActive = true
        timeStartLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10).isActive = true
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[timeStartLabel][timeStartContent]", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        timeStartContent.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[timeStartContent]-[timeEndLabel][timeEndContent]-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(constraints)
    }
}

















