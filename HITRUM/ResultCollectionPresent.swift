//
//  ResultCollectionPresent.swift
//  HITRUM
//
//  Created by SSd on 5/3/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit


class ResultCollectionPresent: UICollectionViewController {
    
    var requestResult = [RequestResultModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func removeItemAtIndexPath(indexPath : IndexPath){
        
        var newRequestResult = [RequestResultModel]()
        print("remove position \(indexPath.item)")
        for (index,data) in requestResult.enumerated(){
            if(index != indexPath.item){
                newRequestResult.append(data)
            }
        }
        self.requestResult = newRequestResult
        
    }
  
}
