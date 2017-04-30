//
//  File.swift
//  HITRUM
//
//  Created by SSd on 4/30/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class ChooseLocationResult {

    let addressTitle  : String?
    let addressDetail : String?
    
    init(addressTitle : String,addressDetail : String) {
        self.addressDetail = addressDetail
        self.addressTitle = addressTitle
    }
    
}

