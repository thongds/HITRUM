//
//  MenuModel.swift
//  HITRUM
//
//  Created by SSd on 4/27/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class MenuModel {
    
    var menuIco = UIImageView()
    var menuLabel = UILabel()
    
    init(menuIco : UIImageView,menuLabelString : String) {
        self.menuIco = menuIco
        self.menuLabel.text = menuLabelString
    }
    
}
