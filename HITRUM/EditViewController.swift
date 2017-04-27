//
//  EditViewController.swift
//  HITRUM
//
//  Created by SSd on 4/27/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class EditViewController: EditPresent {

    
    
    let avatarWidth = 90
    let viewHeaderHeigh = 60
    
    let avatar : CustomImage = {
        let imageView = CustomImage()
        imageView.image = #imageLiteral(resourceName: "default_image")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = CGFloat(90/2)
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let viewHeader = UIView()
    
    let scrollView = UIScrollView()
    let scrollViewHolder = UIView()
    
    let lastNameLabel = UILabel()
    let lastNameTextField = UITextField()
    
    let firstNameLabel = UILabel()
    let firstNameTextField = UITextField()
    
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    
    let phoneNumberLabel = UILabel()
    let phoneCode = UILabel()
    let phoneNumber = UITextField()
    
    let nextButton = UIButton.activeButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        phoneNumber.keyboardType = .numberPad
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        
  
        
        nextButton.setTitle("Lưu", for: .normal)
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
        let views : [String : Any] = ["lastNameLabel" : lastNameLabel,"lastNameTextField" :lastNameTextField,"firstNameLabel" :firstNameLabel,"firstNameTextField" : firstNameTextField,"emailLabel" :emailLabel,"emailTextField":emailTextField,"phoneNumberLabel" :phoneNumberLabel,"phoneCode" :phoneCode,"phoneNumber" :phoneNumber,"nextButton":nextButton]
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
