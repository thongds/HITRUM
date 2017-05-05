//
//  TransitionDelegate.swift
//  HITRUM
//
//  Created by SSd on 5/5/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation
import UIKit

class TransitionDelegate : NSObject, UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let controller = AnimatedTransitioning()
        return controller
        
    }
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
}
