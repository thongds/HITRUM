//
//  SliderCollectionViewController.swift
//  HITRUM
//
//  Created by SSd on 5/5/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SliderCollectionViewController_Cell"

class SliderCollectionViewController: SliderCollectionViewPresent {

    public var itemWidth : CGFloat = 0
    public let lineSpace : CGFloat = 20
    public let marginSpace : CGFloat = 40
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView.backgroundColor = UIColor.white
        collectionView?.backgroundColor = UIColor.clear
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Register cell classes
        self.collectionView!.register(SliderCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.showsHorizontalScrollIndicator = false
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        print((collectionView?.frame.width)!)
        itemWidth = (collectionView?.frame.width)! - (marginSpace*2)
        layout.itemSize = CGSize(width: itemWidth , height: view.frame.height * 2/3)
        layout.minimumLineSpacing = lineSpace
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: marginSpace, bottom: 0, right: marginSpace)
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
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SliderCell
    
        // Configure the cell
        cell.backgroundColor = UIColor.white
        return cell
    }

  
}

//extension SliderCollectionViewController : UIScrollViewDelegate, UICollectionViewDelegate{
//    
//    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        
//    }
//}





























