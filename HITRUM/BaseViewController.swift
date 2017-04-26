//
//  BaseViewController.swift
//  HITRUM
//
//  Created by SSd on 4/26/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class BaseViewController : UIViewController {

    var navigationHeight : CGFloat = 0
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.topItem?.title = " "
        navigationHeight = (navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height
    }
    
}
