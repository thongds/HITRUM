//
//  ServicePresent.swift
//  HITRUM
//
//  Created by SSd on 5/5/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class ServicePresent: UIViewController {

    let closeImage = UIImageView(image: #imageLiteral(resourceName: "close_slider_ico"))
    let selectImage = UIImageView(image: #imageLiteral(resourceName: "select_slide_ico"))
    var buttomHeight : CGFloat = 0
    var spaceCloseTop : CGFloat = 0
    let spaceCenter : CGFloat = 50

    let slider = SliderCollectionViewController(collectionViewLayout : UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.closeViewController))
        closeImage.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    func closeViewController(){
        self.dismiss(animated: true, completion: nil)
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
