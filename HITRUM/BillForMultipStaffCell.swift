//
//  BillForMultipStaffCell.swift
//  HITRUM
//
//  Created by SSd on 5/7/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation
import UIKit

protocol BillForMultipStaffCellDelegate {
    func collectionView(_ collectionViewCell : UICollectionViewCell)

}
class BillForMultipStaffCell : BaseCollectionViewCell {

    var delegate : BillForMultipStaffCellDelegate? = nil
    let viewHolder = UIView()
    let avatarHeight = 60
    
    //finish worker layout element
    let timeStartLabel = UILabel()
    let priceLabel = UILabel()
    let timeEndLabel = UILabel()
    let remarkLabel = UILabel()
    //woring layout element
    let infoLabel = UILabel()
    let startIco = UIImageView(image: #imageLiteral(resourceName: "start_ico"))
    let seprateLine = UIView()
    let phoneIcoWhite = UIImageView(image: #imageLiteral(resourceName: "phone_ico_white"))
    let phonIcoBlack = UIImageView(image: #imageLiteral(resourceName: "phone_ico"))
    
    let remarkArea = UIView()
    let avatar : CustomImage = {
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

    let userName = UILabel()
    

    
    var billForMultipStaffModel : BillForMultipStaffModel? {
        didSet{
            switch (billForMultipStaffModel?.type)! {
            case  BillWorkerStatus.FINISH.rawValue :
                
                 initFinishLayout()
                break
            case  BillWorkerStatus.WORKING.rawValue :
                
                initWorkingLayout()
                break
            case  BillWorkerStatus.COMMING.rawValue :
                
                initCommingLayout()
                break
                
            default:
                break
            }
        }
    }
    override func setupViews() {
       contentView.layer.cornerRadius = 3
       remarkLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.show))
       remarkLabel.addGestureRecognizer(tap)
    }
    
    func show(){
        if let delegate = delegate {
            delegate.collectionView(self)
        }
    }
    
    func initFinishLayout(){
        let remarkAreaHeight = 50
        let itemHeight = 140
        let leftTexWidth = (contentView.frame.width - CGFloat((10+avatarHeight+10)))/2 - 10
        viewHolder.frame = self.contentView.frame
        self.contentView.addSubview(viewHolder)
        self.contentView.backgroundColor = UIColor.init(hexString: "#FFBF00")
        remarkArea.translatesAutoresizingMaskIntoConstraints = false
        remarkArea.backgroundColor = UIColor.clear
        remarkArea.backgroundColor = UIColor.init(hexString: "#FFBF00")
        contentView.addSubview(remarkArea)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.text = billForMultipStaffModel?.name
        
       
        
        timeStartLabel.translatesAutoresizingMaskIntoConstraints = false
        timeStartLabel.text = NSLocalizedString("time_start", comment: "") + (billForMultipStaffModel?.timeStart)!
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.text = billForMultipStaffModel?.price
        timeEndLabel.translatesAutoresizingMaskIntoConstraints = false
        timeEndLabel.text = NSLocalizedString("time_end", comment: "") + (billForMultipStaffModel?.timeEnd)!
        
        userName.textColor = UIColor.white
        priceLabel.textColor = UIColor.white
        timeEndLabel.textColor = UIColor.white
        timeStartLabel.textColor = UIColor.white
        
        self.contentView.addSubview(avatar)
        self.contentView.addSubview(userName)
        self.contentView.addSubview(timeStartLabel)
        self.contentView.addSubview(priceLabel)
        contentView.addSubview(timeEndLabel)
        
        let views = ["avatar" :avatar,"remarkArea" :remarkArea]
        let metrics = ["avatarCenterY" : (itemHeight - remarkAreaHeight - avatarHeight)/2,"remarkAreaHeight" :remarkAreaHeight ,"avatarHeight" :avatarHeight]
        //top area
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-avatarCenterY-[avatar(avatarHeight)]", options:[], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[avatar(avatarHeight)]", options:[], metrics: metrics, views: views))
        userName.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 10).isActive = true
        userName.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10).isActive = true
        
        timeStartLabel.font = UIFont(name: timeStartLabel.font.fontName, size: 10)
        timeStartLabel.bottomAnchor.constraint(equalTo: avatar.bottomAnchor, constant: -10).isActive = true
        timeStartLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10).isActive = true
        //timeStartLabel.widthAnchor.constraint(equalToConstant: leftTexWidth).isActive = true
       
        priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -10).isActive = true
        priceLabel.lastBaselineAnchor.constraint(equalTo: userName.lastBaselineAnchor).isActive = true
        
        timeEndLabel.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor).isActive = true
        timeEndLabel.lastBaselineAnchor.constraint(equalTo: timeStartLabel.lastBaselineAnchor).isActive = true
        //timeEndLabel.widthAnchor.constraint(equalToConstant: leftTexWidth).isActive = true
        timeEndLabel.font = UIFont(name: timeEndLabel.font.fontName, size: 10)
        timeEndLabel.textAlignment = .right
        
//        timeStartLabel.textAlignment = .center
//        timeStartLabel.minimumScaleFactor = 10/UIFont.labelFontSize
//        timeStartLabel.adjustsFontSizeToFitWidth = true
//        
//        timeEndLabel.textAlignment = .center
//        timeEndLabel.minimumScaleFactor = 10/UIFont.labelFontSize
//        timeEndLabel.adjustsFontSizeToFitWidth = true
        
        //remark area
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[remarkArea(remarkAreaHeight)]|", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[remarkArea]|", options: [], metrics: nil, views: views))
        
        let sepreateLine = UIView()
        sepreateLine.backgroundColor = UIColor.init(hexString: "#E69900")
        sepreateLine.translatesAutoresizingMaskIntoConstraints = false
        
        let seprateLineCenter = UIView()
        seprateLineCenter.backgroundColor = UIColor.init(hexString: "#E69900")
        seprateLineCenter.translatesAutoresizingMaskIntoConstraints = false
        
        let starRemarkIco = UIImageView(image: #imageLiteral(resourceName: "star_remark"))
        starRemarkIco.translatesAutoresizingMaskIntoConstraints = false
        let loveIco = UIImageView(image: #imageLiteral(resourceName: "love_ico"))
        loveIco.translatesAutoresizingMaskIntoConstraints = false
        
       
        remarkLabel.textColor = UIColor.white
        remarkLabel.translatesAutoresizingMaskIntoConstraints = false
        remarkLabel.text = NSLocalizedString("remark_label", comment: "")
        remarkLabel.numberOfLines = 0
        remarkLabel.sizeToFit()
        //remarkLabel.frame.size.width = CGFloat(MAXFLOAT)
        let loveLabel = UILabel()
        loveLabel.textColor = UIColor.white
        loveLabel.translatesAutoresizingMaskIntoConstraints = false
        loveLabel.text = NSLocalizedString("love_label", comment: "")
        loveLabel.numberOfLines = 0
        loveLabel.sizeToFit()
        
        remarkArea.addSubview(sepreateLine)
        remarkArea.addSubview(seprateLineCenter)
        remarkArea.addSubview(starRemarkIco)
        remarkArea.addSubview(loveIco)
        remarkArea.addSubview(loveLabel)
        remarkArea.addSubview(remarkLabel)
        let lefWidthToCenter = (viewHolder.frame.width/2 - (remarkLabel.frame.width + 10 + starRemarkIco.frame.width) )/2
        let rightWidthToCenter = (viewHolder.frame.width/2 - (loveLabel.frame.width + 10 + loveIco.frame.width) )/2
        
        let remarkAreaMetrics  = ["lefWidthToCenter" : lefWidthToCenter ,"rightWidthToCenter" :rightWidthToCenter]
        let remarkAreaView = ["sepreateLine" : sepreateLine,"seprateLineCenter" :seprateLineCenter,"starRemarkIco":starRemarkIco,"remarkLabel" :remarkLabel,"loveIco" :loveIco,"loveLabel" :loveLabel]
        
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[sepreateLine(1)]", options: [], metrics: nil, views: remarkAreaView))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[sepreateLine]|", options: [], metrics: nil, views: remarkAreaView))
        seprateLineCenter.centerXAnchor.constraint(equalTo: remarkArea.centerXAnchor).isActive = true
        seprateLineCenter.widthAnchor.constraint(equalToConstant: 1.0).isActive = true
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[seprateLineCenter]-|", options: [], metrics: nil, views: remarkAreaView))
        
        remarkLabel.centerYAnchor.constraint(equalTo: remarkArea.centerYAnchor).isActive = true
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-lefWidthToCenter-[starRemarkIco]", options: [], metrics: remarkAreaMetrics, views: remarkAreaView))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[starRemarkIco]-[remarkLabel]", options: [.alignAllLastBaseline], metrics: remarkAreaMetrics, views: remarkAreaView))
        
        loveLabel.centerYAnchor.constraint(equalTo: remarkArea.centerYAnchor).isActive = true
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[loveLabel]-rightWidthToCenter-|", options: [], metrics: remarkAreaMetrics, views: remarkAreaView))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[loveIco]-[loveLabel]", options: [.alignAllLastBaseline], metrics: remarkAreaMetrics, views: remarkAreaView))
        
        
    }
    
    func initWorkingLayout(){
        self.contentView.backgroundColor = UIColor.appBaseColor()
        
        initCommonView()

        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        startIco.translatesAutoresizingMaskIntoConstraints = false
        seprateLine.translatesAutoresizingMaskIntoConstraints = false
        phoneIcoWhite.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(infoLabel)
        contentView.addSubview(startIco)
        contentView.addSubview(seprateLine)
        contentView.addSubview(phoneIcoWhite)
        contentView.addSubview(timeStartLabel)
        let views = ["sepreateLine":seprateLine,"phoneIcoWhite" :phoneIcoWhite]
        
        userName.topAnchor.constraint(equalTo: avatar.topAnchor).isActive = true
        userName.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10).isActive = true
        userName.textColor = UIColor.white
        userName.text = (billForMultipStaffModel?.name)!
        
        infoLabel.textColor = UIColor.white
        infoLabel.text =  "\(String(describing: (billForMultipStaffModel?.sex)!)) . \(String(describing: (billForMultipStaffModel?.age)!)) \(NSLocalizedString("age", comment: "")) . \(String(describing: (billForMultipStaffModel?.rating)!))"
        infoLabel.leadingAnchor.constraint(equalTo: userName.leadingAnchor).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: avatar.centerYAnchor).isActive = true
        infoLabel.font = UIFont(name: infoLabel.font.fontName, size: 13)
        infoLabel.textAlignment = .left
        
        startIco.leadingAnchor.constraint(equalTo: infoLabel.trailingAnchor, constant: 3).isActive = true
        startIco.lastBaselineAnchor.constraint(equalTo: infoLabel.lastBaselineAnchor).isActive = true
        
        timeStartLabel.translatesAutoresizingMaskIntoConstraints = false
        timeStartLabel.textColor = UIColor.white
        timeStartLabel.text = NSLocalizedString("time_start", comment: "") + (billForMultipStaffModel?.timeStart)!
        timeStartLabel.font = UIFont(name: timeStartLabel.font.fontName, size: 10)
        
        timeStartLabel.bottomAnchor.constraint(equalTo: avatar.bottomAnchor).isActive = true
        timeStartLabel.leadingAnchor.constraint(equalTo: userName.leadingAnchor).isActive = true
        
        seprateLine.backgroundColor = UIColor.init(hexString: "#66C711")
        
        let metric = ["centerX" : (90-phoneIcoWhite.frame.width)/2]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[sepreateLine]-|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[sepreateLine(1)]-90-|", options: [], metrics: nil, views: views))
       
        phoneIcoWhite.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[phoneIcoWhite]-centerX-|", options: [], metrics: metric, views: views))
        
        
    }
    
    func initCommingLayout(){
        contentView.layer.borderColor = UIColor.init(hexString: "#F5F5F5").cgColor
        contentView.layer.borderWidth = 1.0
        viewHolder.frame = self.contentView.frame
        self.contentView.addSubview(viewHolder)
        self.contentView.backgroundColor = UIColor.white
        initCommonView()
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        startIco.translatesAutoresizingMaskIntoConstraints = false
        seprateLine.translatesAutoresizingMaskIntoConstraints = false
        phonIcoBlack.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(infoLabel)
        contentView.addSubview(startIco)
        contentView.addSubview(seprateLine)
        contentView.addSubview(phonIcoBlack)
        contentView.addSubview(timeStartLabel)
        let views = ["sepreateLine":seprateLine,"phoneIcoWhite" :phonIcoBlack]
        
        userName.topAnchor.constraint(equalTo: avatar.topAnchor).isActive = true
        userName.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10).isActive = true
        userName.textColor = UIColor.black
        userName.text = (billForMultipStaffModel?.name)!
        
        infoLabel.textColor = UIColor.black
        infoLabel.text =  "\(String(describing: (billForMultipStaffModel?.sex)!)) . \(String(describing: (billForMultipStaffModel?.age)!)) \(NSLocalizedString("age", comment: "")) . \(String(describing: (billForMultipStaffModel?.rating)!))"
        infoLabel.leadingAnchor.constraint(equalTo: userName.leadingAnchor).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: avatar.centerYAnchor).isActive = true
        infoLabel.font = UIFont(name: infoLabel.font.fontName, size: 13)
        infoLabel.textAlignment = .left
        
        startIco.leadingAnchor.constraint(equalTo: infoLabel.trailingAnchor, constant: 3).isActive = true
        startIco.lastBaselineAnchor.constraint(equalTo: infoLabel.lastBaselineAnchor).isActive = true
        
        timeStartLabel.translatesAutoresizingMaskIntoConstraints = false
        timeStartLabel.textColor = UIColor.black
        timeStartLabel.text = NSLocalizedString("comming_remain", comment: "") + (billForMultipStaffModel?.timeRemain)!
        timeStartLabel.font = UIFont(name: timeStartLabel.font.fontName, size: 10)
        
        timeStartLabel.bottomAnchor.constraint(equalTo: avatar.bottomAnchor).isActive = true
        timeStartLabel.leadingAnchor.constraint(equalTo: userName.leadingAnchor).isActive = true
        
        seprateLine.backgroundColor = UIColor.init(hexString: "#F5F5F5")
        
        let metric = ["centerX" : (90-phonIcoBlack.frame.width)/2]
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[sepreateLine]-|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[sepreateLine(1)]-90-|", options: [], metrics: nil, views: views))
        
        phonIcoBlack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[phoneIcoWhite]-centerX-|", options: [], metrics: metric, views: views))

       
        
    }
    
    func initCommonView(){
        avatar.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(avatar)
        self.contentView.addSubview(userName)
        
        avatar.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        avatar.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant : 10).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 60).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    override func prepareForReuse() {
        contentView.layer.borderWidth = 0.0
        remarkArea.removeFromSuperview()
        avatar.removeFromSuperview()
        timeStartLabel.removeFromSuperview()
        timeEndLabel.removeFromSuperview()
        priceLabel.removeFromSuperview()
        infoLabel.removeFromSuperview()
        startIco.removeFromSuperview()
        seprateLine.removeFromSuperview()
        phoneIcoWhite.removeFromSuperview()
        phonIcoBlack.removeFromSuperview()
    }
}
