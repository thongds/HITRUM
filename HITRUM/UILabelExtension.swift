//
//  UITextViewHelper.swift
//  HITRUM
//
//  Created by SSd on 4/25/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func setBottomBorder() {
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.init(hexString: "#C7C7C7").cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
