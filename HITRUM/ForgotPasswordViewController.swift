//
//  ForgotPasswordViewController.swift
//  HITRUM
//
//  Created by SSd on 4/29/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: ForgotPasswordPresent {

    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        initView()
        addConstraintView()
    }
    
    func initView(){
        titleHeader.translatesAutoresizingMaskIntoConstraints = false
        titleHeader.text = NSLocalizedString("forgot_password_title", comment: "")
        titleHeader.numberOfLines = 0
        titleHeader.sizeToFit()
        
        phoneCode.text = "+84"
        phoneCode.translatesAutoresizingMaskIntoConstraints = false
        
        phoneNumber.placeholder = NSLocalizedString("phone_number_placeholder", comment: "")
        phoneNumber.keyboardType = .numberPad
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle(NSLocalizedString("next_buttom_text", comment: ""), for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleHeader)
        view.addSubview(phoneCode)
        view.addSubview(phoneNumber)
        view.addSubview(nextButton)
    }
    
    func addConstraintView(){
        let views = ["titleHeader" : titleHeader,"phoneCode": phoneCode,"phoneNumber":phoneNumber,"nextButton" :nextButton]
        
        var constraint = [NSLayoutConstraint]()
        
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[titleHeader]", options: [], metrics: nil, views: views))
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[titleHeader]-|", options: [], metrics: nil, views: views))
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[titleHeader]-40-[phoneCode]", options: [], metrics: nil, views: views))
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[phoneCode(40)]", options: [], metrics: nil, views: views))
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[phoneCode]-[phoneNumber]-|", options: [.alignAllLastBaseline], metrics: nil, views: views))
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[phoneNumber(30)]", options: [], metrics: nil, views: views))
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[phoneCode]-40-[nextButton(60)]", options: [], metrics: nil, views: views))
        constraint.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[nextButton]-|", options: [], metrics: nil, views: views))
        
        NSLayoutConstraint.activate(constraint)
        
    }

    

}






















