//
//  ChooseLocationPresent.swift
//  HITRUM
//
//  Created by SSd on 4/30/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class ChooseLocationPresent: BaseViewController {

    let searchView = UIView()
    let searchTextField = UITextField()
    let searchIco = UIImageView(image: #imageLiteral(resourceName: "search_ico"))
    let clearIco = UIImageView(image: #imageLiteral(resourceName: "close_ico"))
    
    let searchResultCollectionView = SearchResultCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
    override func viewDidLoad() {
        super.viewDidLoad()

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
