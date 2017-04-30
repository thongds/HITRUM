//
//  HistoryDetailModel.swift
//  HITRUM
//
//  Created by SSd on 4/28/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class HistoryDetailModel {

    var userName : String = ""
    var price : String = ""
    var timeStart : String = ""
    var timeEnd : String = ""
    
    init(userName : String, price : String,timeStart : String, timeEnd : String) {
        self.userName = userName
        self.price = price
        self.timeStart = timeStart
        self.timeEnd = timeEnd
    }
}
