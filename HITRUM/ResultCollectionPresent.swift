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
    var swipedArray = [IndexPath]()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func removeItemAtIndexPath(indexPath : IndexPath){
        print(indexPath.item)
        var newRequestResult = [RequestResultModel]()
        var newSwipeArray = [IndexPath]()
        print("remove position \(indexPath.item)")
        for (index,data) in requestResult.enumerated(){
            if(index != indexPath.item){
                newRequestResult.append(data)
                
            }
        }
        self.requestResult = newRequestResult
        
        for (_,data) in swipedArray.enumerated(){
            
            if(data.item != indexPath.item){
                if(data.item > indexPath.item){
                    let indexPath = IndexPath(item: data.item - 1, section: data.section)
                    newSwipeArray.append(indexPath)
                }else{
                    newSwipeArray.append(data)
                }
                
            }
        }
        self.swipedArray = newSwipeArray
    }
    
    func removeIndexInSwipeArray(indexPath : IndexPath){
        for(index,value) in swipedArray.enumerated(){
            if(value.compare(indexPath) == .orderedSame){
                swipedArray.remove(at: index)
            }
        }
        
    }
  
}
