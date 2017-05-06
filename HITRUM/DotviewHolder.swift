//
//  DotviewHolder.swift
//  HITRUM
//
//  Created by SSd on 5/6/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class DotviewHolder: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var dotNumber  = 10
    var spaceBetweenDot  = 10
    var dotDiameter : CGFloat = 0
    var dotArray = [CirclerDot]()
    override init(frame: CGRect) {
        super.init(frame: frame)
        dotDiameter = frame.height
        addDot(frame : frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addDot(frame : CGRect){
        dotArray = [CirclerDot]()
        let dotTotalWidth = CGFloat((dotNumber - 1) * spaceBetweenDot) + (CGFloat(dotNumber) * dotDiameter)
        let dotStartX = (frame.width - dotTotalWidth)/2
        for index in 0 ... dotNumber-1 {
            let xPos = CGFloat(index)*(dotDiameter+CGFloat(spaceBetweenDot)) + dotStartX
            let dot = CirclerDot(frame: CGRect(x:xPos, y: 0, width: frame.height, height: frame.height))
            if(index == 0){
                dot.caShape.fillColor = UIColor.white.cgColor
                
            }else{
                dot.caShape.fillColor = UIColor.gray.cgColor
                
            }
            addSubview(dot)
            dotArray.append(dot)
        }
        
    }
    
    func redrawDot(atPosition : Int){
        print(frame.width)
        for (index,value) in dotArray.enumerated(){
            if(index == atPosition){
                value.caShape.fillColor = UIColor.white.cgColor
            }else{
                value.caShape.fillColor = UIColor.gray.cgColor
            }
        }
    }
}




























