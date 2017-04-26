//
//  UIImageView.swift
//  HITRUM
//
//  Created by SSd on 4/26/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

extension UIImageView {

    class func circleImageView()-> UIImageView{
        
        let image = UIImageView()
        image.layer.borderWidth = 0
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
        return image
    }
    
}
