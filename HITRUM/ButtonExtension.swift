//
//  ButtonHelper.swift
//  HITRUM
//
//  Created by SSd on 4/26/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

extension UIButton {
    
    class func activeButton() -> UIButton {
         let button = UIButton()
         button.backgroundColor = UIColor.appBaseColor()
         button.layer.cornerRadius = 5
         return button
    }
    class func disableButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor.disableButtonColor()
        button.layer.cornerRadius = 5
        return button
    }
    class func dangerButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor.dangerColor()
        button.layer.cornerRadius = 5
        return button
    }
}
