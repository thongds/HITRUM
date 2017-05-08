//
//  ServiceViewController.swift
//  HITRUM
//
//  Created by SSd on 5/5/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class ServiceViewController: ServicePresent {

    var dotArea = DotviewHolder()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sliderHeigh = view.frame.height * 2/3
        let dotAreaHeigh : CGFloat = 10
        let sliderAndDotSpace : CGFloat = 20
        buttomHeight = (view.frame.height - sliderHeigh)/2
        spaceCloseTop = (buttomHeight - closeImage.frame.height)/2
        view.backgroundColor = UIColor.clear
        view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let viewFrame = UIView()
        viewFrame.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height )
        viewFrame.backgroundColor = UIColor.init(hexString: "#D92B2B2B")
        view.addSubview(viewFrame)
        navigationController?.navigationBar.layer.zPosition = -1
        ViewHelper.addCollectionViewController(viewController: self, toView: self.view, collectionView: slider)
        slider.collectionView?.delegate = self
        
        dotArea = DotviewHolder(frame: CGRect(x: 0, y: (view.frame.height-sliderHeigh)/2 -  (dotAreaHeigh + sliderAndDotSpace), width: view.frame.width, height: dotAreaHeigh))
        dotArea.backgroundColor = UIColor.clear

        slider.view.translatesAutoresizingMaskIntoConstraints = false
        closeImage.translatesAutoresizingMaskIntoConstraints = false
        closeImage.isUserInteractionEnabled = true
        selectImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dotArea)
        view.addSubview(selectImage)
        view.addSubview(closeImage)
            let views : [String : Any]  = ["slider" : slider.view,"closeImage" :closeImage,"selectImage":selectImage]
        let metrics = ["sliderHeigh" : (view.frame.height-sliderHeigh)/2,"spaceCloseTop" : spaceCloseTop]
        
        slider.view.backgroundColor = UIColor.clear
        slider.view.heightAnchor.constraint(equalToConstant: sliderHeigh).isActive = true
        slider.view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
            
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[slider]|", options: [], metrics: metrics, views: views))
        
        closeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -spaceCenter).isActive = true
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[slider]-spaceCloseTop-[closeImage]", options: [], metrics: metrics, views: views))
            
        
            
        selectImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: spaceCenter).isActive = true
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[slider]-spaceCloseTop-[selectImage]", options: [], metrics: metrics, views: views))
        
    }
}
extension ServiceViewController : UIScrollViewDelegate, UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth : Float = Float(slider.itemWidth + slider.lineSpace) // width + space
        let currentOffset : Float = Float(scrollView.contentOffset.x)
        let targetOffset : Float = Float(targetContentOffset.pointee.x)
        var newTargetOffset : Float = 0;
        
        if (targetOffset > currentOffset){
            newTargetOffset = ceilf(currentOffset / pageWidth) * pageWidth;
        }else{
            newTargetOffset = floorf(currentOffset / pageWidth) * pageWidth;
        }
        if (newTargetOffset < 0){
            newTargetOffset = 0
        }
        else if (newTargetOffset > Float(scrollView.contentSize.width)){
            newTargetOffset = Float(scrollView.contentSize.width)
        }
        
        targetContentOffset.pointee.x = CGFloat(currentOffset)
        let point = CGPoint(x: CGFloat(newTargetOffset), y: 0)
        print("x :\(newTargetOffset)")
        let currentPage = ceilf(newTargetOffset/pageWidth)
        dotArea.redrawDot(atPosition: Int(currentPage))
        print("newTargetOffset \( currentPage)")
        scrollView.setContentOffset(point, animated: true)
    
   }
}
