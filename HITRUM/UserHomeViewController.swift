//
//  UserHomeViewController.swift
//  HITRUM
//
//  Created by SSd on 4/26/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

import MapKit
import SideMenu

class UserHomeViewController: UserHomePresent {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(addTapped))
        view.backgroundColor = UIColor.white
        initView()
    }
    
    func initView(){
        requestLocationView.translatesAutoresizingMaskIntoConstraints = false
        requestLocationView.backgroundColor = UIColor.white
        requestLocationView.layer.cornerRadius = 5
        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        requestLocationDotImage.translatesAutoresizingMaskIntoConstraints = false
        requestLabel.text = NSLocalizedString("request_location_text", comment: "")
        view.addSubview(mapKit)
        view.addSubview(requestLocationView)
        requestLocationView.addSubview(requestLabel)
        requestLocationView.addSubview(requestLocationDotImage)
        
        let views = ["mapkit" : mapKit,"requestLocationView" : requestLocationView,"requestLabel" : requestLabel,"requestLocationDotImage" : requestLocationDotImage]
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[mapkit]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[mapkit]|", options: [], metrics: nil, views: views))
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[requestLocationView(60)]", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[requestLocationView]-|", options: [], metrics: nil, views: views))
        requestLocationDotImage.centerYAnchor.constraint(equalTo: requestLocationView.centerYAnchor).isActive = true
        requestLocationDotImage.leadingAnchor.constraint(equalTo: requestLocationView.leadingAnchor, constant: 10).isActive = true
        requestLabel.centerYAnchor.constraint(equalTo: requestLocationView.centerYAnchor).isActive = true
        requestLabel.leadingAnchor.constraint(equalTo: requestLocationDotImage.trailingAnchor, constant: 10).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
        if(swipeArray.count > 0){
            self.navigationController!.view.removeGestureRecognizer(swipeArray[0])
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        if(swipeArray.count > 0){
            self.navigationController!.view.addGestureRecognizer(swipeArray[0])
            
        }
        //SideMenuManager.menuEnableSwipeGestures = false
        navigationController?.navigationBar.isHidden = false
        self.title = "HITRUM"
    }
}










