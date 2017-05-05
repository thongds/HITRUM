//
//  ViewHelper.swift
//  HITRUM
//
//  Created by SSd on 5/5/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation
import UIKit

class ViewHelper {
    static func addCollectionViewController(viewController : UIViewController,toView : UIView, collectionView: UIViewController ) {
        collectionView.view.translatesAutoresizingMaskIntoConstraints = false
        toView.addSubview(collectionView.view)
        viewController.addChildViewController(collectionView)
        collectionView.didMove(toParentViewController: viewController)
        
    }
}
