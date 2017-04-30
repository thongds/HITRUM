//
//  HistoryDetailCollectionView.swift
//  HITRUM
//
//  Created by SSd on 4/28/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

private let reuseIdentifier = "HistoryDetailCollectionView_Cell"

class HistoryDetailCollectionView: HistoryDetailCollectionPresent {

    var historyDetail = [HistoryDetailModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(HistoryDetailCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: view.frame.width - 20, height: 120)
        collectionView?.contentOffset = CGPoint(x: 0, y: -20)
        collectionView?.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        initData()
    }
    func initData(){
        for _ in 0...10 {
            historyDetail.append(HistoryDetailModel(userName: "Đỗ Ngọc Nam", price: "59,000đ", timeStart: "13:30:50", timeEnd: "14:30:50"))
        }
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
        return historyDetail.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HistoryDetailCell
    
        cell.backgroundColor = UIColor.white
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.tintBackgroundColor().cgColor
        cell.historyDetailModel = historyDetail[indexPath.item]
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
