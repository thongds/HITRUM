//
//  BillForMultipStaffCollectionViewPresent.swift
//  HITRUM
//
//  Created by SSd on 5/7/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BillForMultipStaffCollectionViewPresent: UICollectionViewController {
    
    var remarkTG = UITapGestureRecognizer()
    var billModel =  [BillForMultipStaffModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0 ... 3 {
            let bill = BillForMultipStaffModel(type: 0, avatart: "", name: "Do Ngoc Nam", price: "59,000d", timeStart: "13:30:50", timeEnd: "14:30:50", sex: "Nam", age: "22", timeRemain: "con 5 phut", rating: 4)
            billModel.append(bill)
        }
        
        for _ in 0 ... 3 {
            let bill = BillForMultipStaffModel(type: 1, avatart: "", name: "Do Ngoc Nam", price: "59,000d", timeStart: "13:30:50", timeEnd: "14:30:50", sex: "Nam", age: "22", timeRemain: "con 5 phut", rating: 3)
            billModel.append(bill)
        }
        
        for _ in 0 ... 3 {
            let bill = BillForMultipStaffModel(type: 2, avatart: "", name: "Do Ngoc Nam", price: "59,000d", timeStart: "13:30:50", timeEnd: "14:30:50", sex: "Nam", age: "22", timeRemain: "con 5 phut", rating: 5)
            billModel.append(bill)
        }
        for _ in 0 ... 3 {
            let bill = BillForMultipStaffModel(type: 0, avatart: "", name: "Do Ngoc Nam", price: "59,000d", timeStart: "13:30:50", timeEnd: "14:30:50", sex: "Nam", age: "22", timeRemain: "con 5 phut", rating: 4)
            billModel.append(bill)
        }
        
        for _ in 0 ... 3 {
            let bill = BillForMultipStaffModel(type: 1, avatart: "", name: "Do Ngoc Nam", price: "59,000d", timeStart: "13:30:50", timeEnd: "14:30:50", sex: "Nam", age: "22", timeRemain: "con 5 phut", rating: 3)
            billModel.append(bill)
        }
        
        for _ in 0 ... 3 {
            let bill = BillForMultipStaffModel(type: 2, avatart: "", name: "Do Ngoc Nam", price: "59,000d", timeStart: "13:30:50", timeEnd: "14:30:50", sex: "Nam", age: "22", timeRemain: "con 5 phut", rating: 5)
            billModel.append(bill)
        }
        
        remarkTG = UITapGestureRecognizer(target: self, action: #selector(self.showRemark))
        
    }
    
    func showRemark(){
        navigationController?.pushViewController(BillForMultipStaffViewController(), animated: true)
    }
    
    

}
