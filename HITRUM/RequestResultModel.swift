//
//  SearchResultModel.swift
//  HITRUM
//
//  Created by SSd on 5/3/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation
import UIKit

class RequestResultModel {

    let type : Int?
    let userAvatart : String?
    let name : String?
    let sex : String?
    let age : String?
    let rating : Int?
    let timeComingRemain : String?
    // working type
    
    let timeStart : String?
    
    init(type : Int,usertAavart : String,name: String,sex : String,age : String, rating : Int,timeComingRemain : String,timeStart : String){
        self.type = type
        self.userAvatart = usertAavart
        self.name = name
        self.sex = sex
        self.age = age
        self.rating = rating
        self.timeStart = timeStart
        self.timeComingRemain = timeComingRemain
    }
    
}

