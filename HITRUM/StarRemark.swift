//
//  StarRemark.swift
//  HITRUM
//
//  Created by SSd on 5/8/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

protocol RemarkDelegate {
    func remakCheckedIndex(index : Int)
}

class StarRemark: UIView {

    
    var enableStarArray = [UIImageView]()
    let disableStarArray = [UIImageView]()
    let space : CGFloat = 10
    var remarkDelegate : RemarkDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        for index  in 0 ... 4 {
            
            let starDisable = UIImageView(image: #imageLiteral(resourceName: "star_disable"))
            starDisable.isUserInteractionEnabled = true
            
            let tapDisable : StarTapGR = StarTapGR(target: self, action: #selector(self.starTaped(gestureReconizer:)))
            tapDisable.index = index
            starDisable.addGestureRecognizer(tapDisable)
            
            starDisable.frame.origin.x = (starDisable.frame.width + 10) * CGFloat(index)
            starDisable.frame.origin.y = 0
            addSubview(starDisable)
            
            let starEnable = UIImageView(image: #imageLiteral(resourceName: "star_enable"))
            starEnable.isUserInteractionEnabled = true
            
            let tapEnable = StarTapGR(target: self, action: #selector(self.starTaped(gestureReconizer:)))
            tapEnable.index = index
            starEnable.addGestureRecognizer(tapEnable)
            starEnable.isHidden = index == 0 ? false : true
            
            starEnable.frame.origin.x = (starEnable.frame.width + 10) * CGFloat(index)
            starEnable.frame.origin.y = 0
            
            addSubview(starEnable)
            enableStarArray.append(starEnable)
            
           
        }
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawEnableStar(numberOfEnableStar : Int){
        for index in 0 ... 4 {
            if (index <= numberOfEnableStar){
                enableStarArray[index].isHidden = false
            }else{
                enableStarArray[index].isHidden = true
            }
        }
    }
    
    func starTaped(gestureReconizer : StarTapGR){
        drawEnableStar(numberOfEnableStar: gestureReconizer.index!)
        if let deletage = remarkDelegate {
            deletage.remakCheckedIndex(index: gestureReconizer.index!)
        }
    }
    
}

class StarTapGR : UITapGestureRecognizer{
    
    var index : Int?
}




















