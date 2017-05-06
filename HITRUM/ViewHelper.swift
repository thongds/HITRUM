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
    static public func createCirclePath(arcCenter: CGPoint,
                                        radius: CGFloat,
                                        startAngle: CGFloat,
                                        endAngle: CGFloat,
                                        clockwise: Bool) -> UIBezierPath {
        
        return UIBezierPath(arcCenter: arcCenter,
                            radius: radius,
                            startAngle: startAngle,
                            endAngle: endAngle,
                            clockwise: clockwise)
    }
    static public func createTrianglePath(x1: CGPoint,x2 : CGPoint,x3: CGPoint) -> UIBezierPath{
        let closePath = UIBezierPath()
        closePath.move(to: x1)
        closePath.addLine(to: x2)
        closePath.addLine(to: x3)
        closePath.addLine(to: x1)
        return closePath
    }
}
