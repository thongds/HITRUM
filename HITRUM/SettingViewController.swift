//
//  settingViewController.swift
//  HITRUM
//
//  Created by SSd on 4/27/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class SettingViewController: SettingPresent {


    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "edit_ico"), style: .plain, target: self, action: #selector(self.showEdit))
        navigationController?.navigationBar.hideBottomHairline()
        view.backgroundColor = UIColor.white
        initView()
    }
   
    func initView(){
        initViewData()
        addViewConstraint()
    }
    
    func initViewData(){
        //header
        viewHeader.translatesAutoresizingMaskIntoConstraints = false
        viewHeader.backgroundColor = UIColor.appBaseColor()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(viewHeader)
        view.addSubview(avatar)
        //content
        initViewContentData()
    
    }
    func initViewContentData(){
        //content
        scrollView.frame = CGRect(x: 0, y: CGFloat(viewHeaderHeigh+(avatarWidth/2)), width: view.frame.width, height: view.frame.height-CGFloat(viewHeaderHeigh+(avatarWidth/2))-CGFloat(navigationHeight))
        scrollView.showsVerticalScrollIndicator = false
        
        scrollViewHolder.frame = scrollView.bounds
        
        lastNameLabel.text = "Họ"
        lastNameLabel.textColor = UIColor.tintColor()
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameTextField.isUserInteractionEnabled = false
        lastNameTextField.setBottomBorder()
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        firstNameLabel.text = "Tên"
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.textColor = UIColor.tintColor()
        firstNameTextField.isUserInteractionEnabled = false
        firstNameTextField.setBottomBorder()
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        emailLabel.text = "email"
        emailLabel.textColor = UIColor.tintColor()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.isUserInteractionEnabled = false
        emailTextField.setBottomBorder()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        phoneNumberLabel.text = "Số điện thoại"
        phoneNumberLabel.textColor = UIColor.tintColor()
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneCode.text = "+84"
        phoneCode.translatesAutoresizingMaskIntoConstraints = false
        phoneNumber.isUserInteractionEnabled = false
        phoneNumber.setBottomBorder()
        phoneNumber.keyboardType = .numberPad
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        
        inviteLabel.text = "Mã giới thiệu"
        inviteLabel.textColor = UIColor.tintColor()
        inviteLabel.translatesAutoresizingMaskIntoConstraints = false
        inviteCode.translatesAutoresizingMaskIntoConstraints = false
        inviteCode.isUserInteractionEnabled = false
        inviteCode.setBottomBorder()
        inviteCode.isUserInteractionEnabled = false
        
        nextButton.setTitle("Đăng xuất", for: .normal)
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
        scrollViewHolder.addSubview(inviteLabel)
        scrollViewHolder.addSubview(inviteCode)
        scrollViewHolder.addSubview(nextButton)
    }
    func addViewConstraint(){
        //header
        let views = ["viewHeader" : viewHeader ,"avatar" : avatar]
        let metrics = ["navigationHeight" :navigationHeight,"viewHeaderHeigh" : viewHeaderHeigh,"avatarTopSpace" : viewHeaderHeigh-(avatarWidth/2),"avatarWidth" : avatarWidth] as [String : Any]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[viewHeader(viewHeaderHeigh)]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[viewHeader]|", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-avatarTopSpace-[avatar(avatarWidth)]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[avatar(avatarWidth)]", options: [], metrics: metrics, views: views))
        avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //content
        addContentConstraint()
    }
    
    func addContentConstraint(){
        let views : [String : Any] = ["lastNameLabel" : lastNameLabel,"lastNameTextField" :lastNameTextField,"firstNameLabel" :firstNameLabel,"firstNameTextField" : firstNameTextField,"emailLabel" :emailLabel,"emailTextField":emailTextField,"phoneNumberLabel" :phoneNumberLabel,"phoneCode" :phoneCode,"phoneNumber" :phoneNumber,"inviteLabel" : inviteLabel,"inviteCode" : inviteCode,"nextButton":nextButton]
        let metrics = ["SpaceTop" :  40,"littleSpace" : 10,"normalSpace" : 30, "doubleSpace" :20,"lastNameLabelWidth" : 80,"buttonHeigh" : 50,"textFieldHeight" : 30] as [String : Any]
        
        let container = UILayoutGuide()
        var contraints = [NSLayoutConstraint]()
        scrollViewHolder.addLayoutGuide(container)
        container.topAnchor.constraint(equalTo: avatar.bottomAnchor,constant : 20).isActive = true
        
        lastNameLabel.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[lastNameLabel(==lastNameLabelWidth)]", options: [], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[lastNameLabel]-doubleSpace-[firstNameLabel]-normalSpace-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[lastNameLabel][lastNameTextField(==textFieldHeight)]", options: [.alignAllLeading,.alignAllTrailing], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[firstNameLabel][firstNameTextField(==textFieldHeight)]", options: [.alignAllTrailing,.alignAllLeading], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[lastNameTextField]-doubleSpace-[emailLabel]", options: [.alignAllLeading,.alignAllTrailing], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[emailLabel][emailTextField(==textFieldHeight)]", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[emailTextField]-normalSpace-|", options: [], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[emailTextField]-normalSpace-[phoneNumberLabel]", options: [.alignAllLeading], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[phoneNumberLabel]-littleSpace-[phoneCode]", options: [.alignAllLeading], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[phoneCode]-littleSpace-[phoneNumber]-normalSpace-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        //invite
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[phoneCode]-normalSpace-[inviteLabel]", options: [.alignAllLeading], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[inviteLabel]-littleSpace-[inviteCode]", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[inviteCode]-normalSpace-|", options: [], metrics: metrics, views: views))
        //button
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[nextButton(==buttonHeigh)]-littleSpace-|", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[nextButton]-normalSpace-|", options: [], metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(contraints)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        UINavigationBar.appearance().shadowImage = UIImage()
        self.title = "Cài đặt"
    }

}
