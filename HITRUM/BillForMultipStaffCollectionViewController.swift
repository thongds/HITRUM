//
//  BillForMultipStaffCollectionViewController.swift
//  HITRUM
//
//  Created by SSd on 5/7/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

private let reuseIdentifier = "BillForMultipStaffCollectionViewController_Cell"
private let resueIdentifierForHeader = "BillForMultipStaffCollectionViewController_header"

class BillForMultipStaffCollectionViewController: BillForMultipStaffCollectionViewPresent, BillCollectionViewLayoutDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(BillForMultipStaffCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.backgroundColor = UIColor.white
        let layout = collectionViewLayout as! BillCollectionViewLayout
       // layout.itemSize = CGSize(width: (collectionView?.frame.width)!, height: 100)
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        layout.delegate = self
        //register header
        self.collectionView!.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: resueIdentifierForHeader)
        layout.headerReferenceSize = CGSize(width: (collectionView?.frame.width)!, height: 40)
        

    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return billModel.count
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: resueIdentifierForHeader, for: indexPath) as! HeaderView
        
        return sectionHeaderView
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BillForMultipStaffCell
        cell.billForMultipStaffModel = billModel[indexPath.item]
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    func collectionView(_ collectionView : UICollectionView, heightForItemAtIndexPath indexPath: IndexPath) -> CGFloat{
        let billModelResult = billModel[indexPath.item]
        if billModelResult.type! == BillWorkerStatus.FINISH.rawValue{
            return 140
        }
        return 100
    }

   
}
