//
//  SelectActionPresent.swift
//  HITRUM
//
//  Created by SSd on 5/9/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class SelectActionPresent: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let leftBar = UIBarButtonItem(image: #imageLiteral(resourceName: "close_ico_white"), style: .plain, target: self, action: #selector(self.close))
        navigationItem.setLeftBarButton(leftBar, animated: true)
    }
    
    func close(){
        dismiss(animated: true, completion: nil)
    }

}
