//
//  NewsModel.swift
//  HITRUM
//
//  Created by SSd on 4/27/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class NewsModel {
    
    var title : String = ""
    var date : String = ""
    var content : String = ""
    
    init(title : String,content : String,date : String) {
        self.title = title
        self.date = date
        self.content = content
    }
}
