//
//  FacebookLoginView.swift
//  HITRUM
//
//  Created by SSd on 4/25/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class FacebookLoginView: FacebookLoginVerifyPresent {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Xác nhận thông tin"
        initView()
    }
    
    func initView(){
        initViewElementData()
        addLayoutConstraint()
    }
    
    func initViewElementData(){
        
        scrollView.frame = view.bounds
        scrollView.showsVerticalScrollIndicator = false
        scrollViewHolder.frame = scrollView.frame
        scrollView.contentSize.height = view.frame.height - navigationHeight
        
        lastNameLabel.text = "Họ"
        lastNameLabel.textColor = UIColor.tintColor()
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameTextField.setBottomBorder()
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        firstNameLabel.text = "Tên"
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.textColor = UIColor.tintColor()
        firstNameTextField.setBottomBorder()
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        emailLabel.text = "email"
        emailLabel.textColor = UIColor.tintColor()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.setBottomBorder()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        phoneNumberLabel.text = "Số điện thoại"
        phoneNumberLabel.textColor = UIColor.tintColor()
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneCode.text = "+84"
        phoneCode.translatesAutoresizingMaskIntoConstraints = false
        phoneNumber.setBottomBorder()
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Tiếp theo", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewHolder)
        scrollViewHolder.addSubview(lastNameLabel)
        scrollViewHolder.addSubview(lastNameTextField)
        scrollViewHolder.addSubview(firstNameTextField)
        scrollViewHolder.addSubview(firstNameLabel)
        scrollViewHolder.addSubview(emailLabel)
        scrollViewHolder.addSubview(emailTextField)
        scrollViewHolder.addSubview(phoneNumberLabel)
        scrollViewHolder.addSubview(phoneCode)
        scrollViewHolder.addSubview(phoneNumber)
        scrollViewHolder.addSubview(nextButton)
    }
    
    func addLayoutConstraint(){
        let views : [String : Any] = ["lastNameLabel" : lastNameLabel,"lastNameTextField" :lastNameTextField,"firstNameLabel" :firstNameLabel,"firstNameTextField" : firstNameTextField,"emailLabel" :emailLabel,"emailTextField":emailTextField,"phoneNumberLabel" :phoneNumberLabel,"phoneCode" :phoneCode,"phoneNumber" :phoneNumber,"nextButton":nextButton]
        let metrics = ["SpaceTop" :  40,"littleSpace" : 10,"normalSpace" : 30, "doubleSpace" :20,"lastNameLabelWidth" : 80,"buttonHeigh" : 50,"textFieldHeight" : 30] as [String : Any]
        
        let container = UILayoutGuide()
        var contraints = [NSLayoutConstraint]()
        scrollViewHolder.addLayoutGuide(container)
        container.topAnchor.constraint(equalTo: scrollViewHolder.topAnchor, constant: 40).isActive = true
    
        lastNameLabel.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[lastNameLabel(==lastNameLabelWidth)]", options: [], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[lastNameLabel]-doubleSpace-[firstNameLabel]-normalSpace-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[lastNameLabel]-littleSpace-[lastNameTextField(==textFieldHeight)]", options: [.alignAllLeading,.alignAllTrailing], metrics: metrics, views: views))

        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[firstNameLabel]-littleSpace-[firstNameTextField(==textFieldHeight)]", options: [.alignAllTrailing,.alignAllLeading], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[lastNameTextField]-doubleSpace-[emailLabel]", options: [.alignAllLeading,.alignAllTrailing], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[emailLabel]-littleSpace-[emailTextField(==textFieldHeight)]", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[emailTextField]-normalSpace-|", options: [], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[emailTextField]-normalSpace-[phoneNumberLabel]", options: [.alignAllLeading], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[phoneNumberLabel]-littleSpace-[phoneCode]", options: [.alignAllLeading], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[phoneCode]-littleSpace-[phoneNumber]-normalSpace-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[phoneNumber]-SpaceTop-[nextButton(==buttonHeigh)]", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[nextButton]-normalSpace-|", options: [], metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(contraints)
    
    
    }
    
   
}






























