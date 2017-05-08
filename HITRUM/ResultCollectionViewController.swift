//
//  ResultCollectionViewController.swift
//  HITRUM
//
//  Created by SSd on 5/3/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ResultCollectionViewController_Cell"

class ResultCollectionViewController: ResultCollectionPresent {

    
    var layout : ResultLayout?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...10 {
            requestResult.append(RequestResultModel(type: 0,usertAavart : "", name: "Do van quy", sex: "name", age: "22" , rating: index, timeComingRemain : "5 phut",timeStart: "01:40:30"))
        }
        for index in 0...5 {
            requestResult.append(RequestResultModel(type: 1,usertAavart : "", name: "Do van quy", sex: "name", age: "22" , rating: index, timeComingRemain : "5 phut",timeStart: "01:40:30"))
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        layout = collectionViewLayout as! ResultLayout
        layout?.scrollDirection = .vertical
     //   layout?.itemSize = CGSize(width: (collectionView?.frame.width)!, height: 100)
//        layout.minimumLineSpacing = 10
        
        // Register cell classes
        self.collectionView!.register(ResultCellCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.backgroundColor = UIColor.darkOpacityColor()
        self.collectionView?.showsVerticalScrollIndicator = false
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
        print(requestResult.count)
        return requestResult.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ResultCellCollectionViewCell
        cell.requestResultData = requestResult[indexPath.item]
        cell.backgroundColor = UIColor.clear
        // Configure the cell
        let swipe = MyGestureReconize(target: self, action: #selector(self.showDelete))
        swipe.viewHolder = cell.viewContent
        swipe.direction = UISwipeGestureRecognizerDirection.left
        cell.addGestureRecognizer(swipe)
        
        let swipe2 = MyGestureReconize(target: self, action: #selector(self.showDelete))
        swipe2.viewHolder = cell.viewContent
        swipe2.direction = UISwipeGestureRecognizerDirection.right
        cell.addGestureRecognizer(swipe2)
        
        cell.cellDelegate = self
        return cell
    }
   
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(BillForMultipStaffViewController(), animated: true)
    }
    
    func showDelete(sender: MyGestureReconize){
        switch sender.direction {
            case UISwipeGestureRecognizerDirection.left:
                if (sender.viewHolder.frame.origin.x >= 0){
                    UIView.animate(withDuration: 0.5, animations: {
                        sender.viewHolder.frame.origin.x = -90
                    })
                }
            break
            
            case UISwipeGestureRecognizerDirection.right:
                if (sender.viewHolder.frame.origin.x < 0){
                    UIView.animate(withDuration: 0.5, animations: {
                        sender.viewHolder.frame.origin.x = 10
                    })
                }
            break
        default:
            break
        }
    }
}
extension ResultCollectionViewController : CellDelegate {
    
    func deleteCellAtIndexPath(viewContent : UIView,cell : ResultCellCollectionViewCell){
        let indexPath = collectionView?.indexPath(for: cell)
        layout?.deleteCache()
        viewContent.frame.origin.x = 10
        removeItemAtIndexPath(indexPath: indexPath!)
        collectionView?.deleteItems(at: [indexPath!])
       // collectionView?.reloadData()
    }
}

    
class MyGestureReconize : UISwipeGestureRecognizer{

    var viewHolder = UIView()
    
}






















