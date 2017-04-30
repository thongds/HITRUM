//
//  SearchResultPresent.swift
//  HITRUM
//
//  Created by SSd on 4/30/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class SearchResultPresent: UICollectionViewController {

    var searchResult = [ChooseLocationResult]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0...10{
            searchResult.append(ChooseLocationResult(addressTitle: "96/24 Hai Bà Trưng", addressDetail: "Ho Chi Minh City, Vietnam"))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
