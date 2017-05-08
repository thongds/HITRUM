//
//  BillForMultipStaffModel.swift
//  HITRUM
//
//  Created by SSd on 5/7/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation

class BillForMultipStaffModel {
 
    var type : Int?
    var avatart : String?
    var name : String?
    var price : String?
    var timeStart : String?
    var timeEnd : String?
    var sex : String?
    var age : String?
    var timeRemain : String?
    var rating : Int?
    init(type : Int,avatart : String,name : String,price : String,timeStart : String,timeEnd : String,sex : String,age : String,timeRemain : String,rating : Int) {
        self.type = type
        self.name = name
        self.price = price
        self.timeStart = timeStart
        self.timeEnd = timeEnd
        self.sex = sex
        self.age = age
        self.timeRemain = timeRemain
        self.rating = rating
    }
    
}
