//
//  SplashController.swift
//  HITRUM
//
//  Created by SSd on 4/23/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class SplashController: UIViewController {

    let splashImage = UIImageView(image: #imageLiteral(resourceName: "Splash"))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true
        splashImage.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(splashImage)
        let yPos = view.bounds.height/2 - splashImage.frame.height/2
        let xPos = view.bounds.width/2 - splashImage.frame.width/2
        
        let views = ["splashImage":splashImage]
        let metrics = ["xPos" : xPos,"yPos" :yPos]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-yPos-[splashImage]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-xPos-[splashImage]", options: [], metrics: metrics, views: views))
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.showHome), userInfo: nil, repeats: false)
    }
    func showHome(){
        let homeUnuser = HomeUnuserViewController()
        navigationController?.setViewControllers([homeUnuser], animated: true)
        //self.navigationController?.pushViewController(homeUnuser, animated: true)
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
