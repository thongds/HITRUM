//
//  ResultCellCollectionViewCell.swift
//  HITRUM
//
//  Created by SSd on 5/3/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

protocol CellDelegate {
    func deleteCellAtIndexPath(viewContent : UIView,cell : ResultCellCollectionViewCell)
}

class ResultCellCollectionViewCell: BaseCollectionViewCell {
    
    var cellDelegate : CellDelegate?
    var requestResultData : RequestResultModel?{
        didSet{
           userNameLabel.text = requestResultData?.name
           sexLabel.text = requestResultData?.sex
            ageContent.text = requestResultData?.age
            if let rating = requestResultData?.rating{
                ratingLabel.text = String(describing: rating)
            }
            if let type = requestResultData?.type{
                timeLabel.text = type == RequestResultType.WORKING.rawValue ? NSLocalizedString("time_start", comment: "") : NSLocalizedString("comming_remain", comment: "")
                viewContent.backgroundColor = type == RequestResultType.WORKING.rawValue ? UIColor.workingBackgroundColor() : UIColor.white
            }
            
            timeContent.text = requestResultData?.timeStart
        }
    }
   
    
    let avatart : CustomImage = {
        let imageView = CustomImage()
        imageView.image = #imageLiteral(resourceName: "default_image")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = CGFloat(60/2)
        imageView.layer.masksToBounds = true
        return imageView
    }()

    let viewContent = UIView()
    
    var infoAreaWidth : CGFloat = 0
    
    let userNameLabel = UILabel()
    let sexLabel = UILabel()
    let dotSeprate1 = UILabel()
    let dotSeprate2 = UILabel()
    let ratingLabel = UILabel()
    let ratingFiveStartImage = UIImageView(image: #imageLiteral(resourceName: "start_ico"))
    let ratingLessFiveStartImage = UIImageView(image: #imageLiteral(resourceName: "haft_start_ico"))
    let phoneIco = UIImageView(image: #imageLiteral(resourceName: "phone_ico"))
    let timeContent = UILabel()
    let timeLabel = UILabel()
    let seprateLine = UIView()
    let ageLabel = UILabel()
    let ageContent = UILabel()
    
    let removeIco = UIImageView(image: #imageLiteral(resourceName: "remove_ico"))
    let removeArea = UIView()
    
    override func setupViews() {
        
        //remove Area
        self.contentView.addSubview(removeArea)
        removeArea.frame = CGRect(x: self.contentView.frame.width - (100 + 10), y: 0, width: 100, height: self.contentView.frame.height)
        removeArea.addSubview(removeIco)
        removeArea.backgroundColor = UIColor.red
        //removeArea.layer.cornerRadius = 3
        
        removeIco.translatesAutoresizingMaskIntoConstraints = false
        removeIco.centerYAnchor.constraint(equalTo: removeArea.centerYAnchor).isActive = true
        removeIco.centerXAnchor.constraint(equalTo: removeArea.centerXAnchor).isActive = true
        
        //self.contentView.bringSubview(toFront: viewContent)
        
        removeArea.isUserInteractionEnabled = true
        removeIco.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.delete(sender:)))
        removeIco.addGestureRecognizer(tap)
        removeArea.addGestureRecognizer(tap)
        
        
        viewContent.frame = CGRect(x: 10, y: 0, width: self.contentView.frame.width - 20, height: self.contentView.frame.height)
        //viewContent.layer.cornerRadius = 3
        infoAreaWidth = viewContent.frame.width - ( 10 + 60 + 10 + 100 )
        
        avatart.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        dotSeprate1.translatesAutoresizingMaskIntoConstraints = false
        dotSeprate2.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingFiveStartImage.translatesAutoresizingMaskIntoConstraints = false
        ratingLessFiveStartImage.translatesAutoresizingMaskIntoConstraints = false
        timeContent.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        seprateLine.translatesAutoresizingMaskIntoConstraints = false
        phoneIco.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageContent.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        //init view data
        
        sexLabel.font = UIFont(name: sexLabel.font.fontName, size: 12)
        ageLabel.font = UIFont(name: ageLabel.font.fontName, size: 12)
        ageContent.font = UIFont(name: ageContent.font.fontName, size: 12)
        ratingLabel.font = UIFont(name: ratingLabel.font.fontName, size: 12)
        timeLabel.font = UIFont(name: timeLabel.font.fontName, size: 11)
        timeContent.font = UIFont(name: timeContent.font.fontName, size: 10)
        
        ageLabel.text = NSLocalizedString("age", comment: "")
        timeLabel.text = NSLocalizedString("comming_remain", comment: "")
        dotSeprate1.text = "."
        dotSeprate2.text = "."
        seprateLine.backgroundColor = UIColor.tintColor()
        
        
        self.contentView.backgroundColor = UIColor.clear
        self.contentView.addSubview(viewContent)
        viewContent.addSubview(avatart)
        viewContent.addSubview(userNameLabel)
        viewContent.addSubview(sexLabel)
        viewContent.addSubview(dotSeprate1)
        viewContent.addSubview(ageLabel)
        viewContent.addSubview(ageContent)
        viewContent.addSubview(dotSeprate2)
        viewContent.addSubview(ratingLabel)
        viewContent.addSubview(ratingFiveStartImage)
        viewContent.addSubview(timeContent)
        viewContent.addSubview(timeLabel)
        viewContent.addSubview(seprateLine)
        viewContent.addSubview(phoneIco)
        
        
        let views = ["avatart" : avatart,"userNameLabel" :userNameLabel,"sexLabel" :sexLabel,"dotSeprate1" :dotSeprate1,"dotSeprate2":dotSeprate2,"ratingLabel":ratingLabel,"timeLabel" :timeLabel,"timeContent" :timeContent,"seprateLine" :seprateLine, "phoneIco" :phoneIco,"ageLabel" :ageLabel,"ageContent" :ageContent,"ratingFiveStartImage" :ratingFiveStartImage]
        let metrics = ["infoAreaWidth" :infoAreaWidth]
        
        var constraints = [NSLayoutConstraint]()
        
        avatart.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        avatart.heightAnchor.constraint(equalToConstant: 60).isActive = true
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[avatart(60)]", options: [], metrics: nil, views: views))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[avatart]-[userNameLabel]", options: [.alignAllTop], metrics: nil, views: views))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[userNameLabel][sexLabel]", options: [.alignAllLeading], metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[sexLabel]-5-[dotSeprate1]-5-[ageLabel]-5-[ageContent]-5-[dotSeprate2]-5-[ratingLabel][ratingFiveStartImage]", options: [.alignAllLastBaseline], metrics: nil, views: views))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[sexLabel][timeLabel]", options: [.alignAllLeading], metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[timeLabel]-2-[timeContent]", options: [.alignAllLastBaseline], metrics: nil, views: views))
        
        phoneIco.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[phoneIco]-40-|", options: [], metrics: nil, views: views))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-[seprateLine]-|", options: [], metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[seprateLine(1)]-40-[phoneIco]", options: [], metrics: nil, views: views))
        
        NSLayoutConstraint.activate(constraints)
        
        
    }
    
    override func prepareForReuse() {
        viewContent.frame = CGRect(x: 10, y: 0, width: self.contentView.frame.width - 20, height: self.contentView.frame.height)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        return layoutAttributes
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
    }
    
    func delete(sender: UITapGestureRecognizer){
        if let cellDelegate = cellDelegate{
                cellDelegate.deleteCellAtIndexPath(viewContent :self.contentView,cell : self)
        }
    }
    
}


























