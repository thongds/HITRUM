//
//  SelectActionCollectionView.swift
//  HITRUM
//
//  Created by SSd on 5/9/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SelectActionCollectionView: SelectActionPresent {

    var preSelect = IndexPath()
    var currentSelect = IndexPath()
    var selectArray = [IndexPath]()
    var isInit = true
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.tintBackgroundColor()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(SelectActionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: (collectionView?.frame.width)!, height: 50)
        layout.minimumLineSpacing = 1
        selectArray.append(IndexPath(item: -1, section: 0))
        selectArray.append(IndexPath(item: 0, section: 0))
//        selectArray[0] = IndexPath(item: -1, section: 1)
//        selectArray[1] = IndexPath(item: 0, section: 1)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 100
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SelectActionCell
        cell.backgroundColor = UIColor.white
        print("row \(indexPath.row)")
        print("item \(indexPath.item)")
        print("section \(indexPath.section)")
        if(indexPath.compare(selectArray[1]) == .orderedSame){
            cell.checkImage.isHidden = false
        }
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectArray[0] = selectArray[1]
        selectArray[1] = indexPath
        if let cell = collectionView.cellForItem(at: selectArray[0]){
            let cell2 = cell as! SelectActionCell
            cell2.checkImage.isHidden = true
            
        }
        collectionView.reloadData()
        
    }

}
