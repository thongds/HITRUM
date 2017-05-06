//
//  CirclerDot.swift
//  HITRUM
//
//  Created by SSd on 5/6/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class CirclerDot: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var caShape = CAShapeLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        caShape.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        let startAngle = CGFloat(0.0)
        let endAngle = CGFloat(2.0 * .pi)
        let clockwise = true
        let circlePath = ViewHelper.createCirclePath(arcCenter: CGPoint(x: frame.size.width/2,y : frame.size.height/2), radius: frame.size.width/2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        //caShape.fillColor = UIColor.gray.cgColor
        caShape.strokeColor = UIColor.clear.cgColor
        caShape.path = circlePath.cgPath
        layer.addSublayer(caShape)

    }

}
