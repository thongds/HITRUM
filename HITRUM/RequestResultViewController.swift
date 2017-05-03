//
//  RequestResultViewController.swift
//  HITRUM
//
//  Created by SSd on 5/3/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit
import MapKit
class RequestResultViewController: RequestResultPresent {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        initView()
    }
    
    func initView(){
        requestLocationView.translatesAutoresizingMaskIntoConstraints = false
        requestLocationView.backgroundColor = UIColor.white
        requestLocationView.layer.cornerRadius = 5
        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        requestLocationDotImage.translatesAutoresizingMaskIntoConstraints = false
        requestLabel.text = "150 Minh Phụng, Phường 5, Quận 11"
        
        view.addSubview(mapKit)
        view.addSubview(requestLocationView)
        addCollectionViewController(collectionView: self.resultCollection)
        requestLocationView.addSubview(requestLocationDotImage)
        requestLocationView.addSubview(requestLabel)
        
        let views = ["mapkit" : mapKit,"requestLocationView" : requestLocationView,"requestLabel" : requestLabel,"requestLocationDotImage" : requestLocationDotImage]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[mapkit]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[mapkit]|", options: [], metrics: nil, views: views))
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[requestLocationView(60)]", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[requestLocationView]-|", options: [], metrics: nil, views: views))
        requestLocationDotImage.centerYAnchor.constraint(equalTo: requestLocationView.centerYAnchor).isActive = true
        requestLocationDotImage.leadingAnchor.constraint(equalTo: requestLocationView.leadingAnchor, constant: 10).isActive = true
        requestLocationDotImage.widthAnchor.constraint(equalToConstant: requestLocationDotImage.frame.width).isActive = true
        requestLabel.centerYAnchor.constraint(equalTo: requestLocationView.centerYAnchor).isActive = true
        requestLabel.leadingAnchor.constraint(equalTo: requestLocationDotImage.trailingAnchor, constant: 10).isActive = true
        requestLabel.trailingAnchor.constraint(equalTo: requestLocationView.trailingAnchor, constant: -10).isActive = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func addCollectionViewController( collectionView: UIViewController) {
        collectionView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView.view)
        addChildViewController(collectionView)
        collectionView.didMove(toParentViewController: self)
        
    }
   
}
