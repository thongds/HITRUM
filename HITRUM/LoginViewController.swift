//
//  LoginViewController.swift
//  HITRUM
//
//  Created by SSd on 4/23/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit



class LoginViewController: LoginPresent {
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.setNotificationKeyboard(keyboardNotification : self)
        initLayout()
        
    }
    
    
    func initLayout(){
        initViewElementData()
        addLayoutConstraint()
    }
    func initViewElementData(){
        
        scrollView.frame = view.bounds
        scrollView.showsVerticalScrollIndicator = false
        scrollViewHolder.frame = scrollView.frame
        scrollView.contentSize.height = view.frame.height - navigationHeight
        
        orLabelCenter.text = "hoặc"
        orLabelCenter.textColor = UIColor.tintColor()
        orLabelCenter.translatesAutoresizingMaskIntoConstraints = false
        
        loginFacebook.translatesAutoresizingMaskIntoConstraints = false
        loginFacebook.setTitle("Đăng nhập qua Facebook", for: .normal)
        loginFacebook.layer.backgroundColor = UIColor.facebookColor().cgColor
        loginFacebook.layer.cornerRadius = 5
        loginFacebook.setImage(#imageLiteral(resourceName: "facebook_ico"), for: .normal)
        loginFacebook.imageEdgeInsets.right = 20
        
        line1.translatesAutoresizingMaskIntoConstraints = false
        line1.backgroundColor = UIColor.tintColor()
        line2.translatesAutoresizingMaskIntoConstraints = false
        line2.backgroundColor = UIColor.tintColor()
        
        phoneCode.translatesAutoresizingMaskIntoConstraints = false
        phoneCode.text = "+84"
        //phoneCode.setBottomBorder()
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        phoneNumber.keyboardType = .numberPad
        phoneNumber.placeholder = "Số điện thoại"
        phoneNumber.setBottomBorder()
        
        password.translatesAutoresizingMaskIntoConstraints = false
        password.isSecureTextEntry = true
        password.placeholder = "Mật Khẩu"
        password.setBottomBorder()
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Đăng Nhập", for: .normal)
        
        
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordLabel.text = "Quên mật khẩu ?"
        forgotPasswordLabel.textColor = UIColor.init(hexString: "#8FDD49")
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewHolder)
        
        scrollViewHolder.addSubview(loginFacebook)
        scrollViewHolder.addSubview(orLabelCenter)
        scrollViewHolder.addSubview(line2)
        scrollViewHolder.addSubview(line1)
        scrollViewHolder.addSubview(phoneCode)
        scrollViewHolder.addSubview(phoneNumber)
        scrollViewHolder.addSubview(password)
        scrollViewHolder.addSubview(loginButton)
        scrollViewHolder.addSubview(forgotPasswordLabel)
    }
    func addLayoutConstraint(){
        let fb_seprate_space = 30
        let views : [String : Any] = ["loginFacebook" : loginFacebook,"orLabelCenter" :orLabelCenter,"line1" :line1,"line2" : line2,"phoneCode" :phoneCode,"phoneNumber":phoneNumber,"password" :password,"loginButton" :loginButton,"forgotPasswordLabel" :forgotPasswordLabel]
        let metrics = ["loginFacebookSpaceTop" :  40,"littleSpace" : 10,"normalSpace" : fb_seprate_space, "doubleSpace" :fb_seprate_space+10,"buttonHeigh" : 50,"textFieldHeight" : 40] as [String : Any]
        
        let container = UILayoutGuide()
        var contraints = [NSLayoutConstraint]()
        scrollViewHolder.addLayoutGuide(container)
        container.topAnchor.constraint(equalTo: scrollViewHolder.topAnchor, constant: 0).isActive = true
        
        loginFacebook.topAnchor.constraint(equalTo: container.topAnchor, constant : 40).isActive = true
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[loginFacebook]-normalSpace-|", options: [], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[loginFacebook(==buttonHeigh)]", options: [], metrics: metrics, views: views))
        contraints.append(orLabelCenter.centerXAnchor.constraint(equalTo: scrollViewHolder.centerXAnchor))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[loginFacebook]-normalSpace-[orLabelCenter]", options: [], metrics: metrics, views: views))
        line1.topAnchor.constraint(equalTo: orLabelCenter.topAnchor,constant : 10).isActive = true
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[line1]-littleSpace-[orLabelCenter]", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[line1(==1)]", options: [], metrics: metrics, views: views))
        line2.topAnchor.constraint(equalTo: orLabelCenter.topAnchor,constant : 10).isActive = true
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[orLabelCenter]-littleSpace-[line2]-normalSpace-|", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[line2(==1)]", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[orLabelCenter]-normalSpace-[phoneCode]", options: [], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[phoneCode]-littleSpace-[phoneNumber]-normalSpace-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[phoneNumber(==textFieldHeight)]", options: [], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[phoneCode]-normalSpace-[password(==textFieldHeight)]", options: [], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[password]-normalSpace-|", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[password]-normalSpace-[loginButton(==buttonHeigh)]", options: [.alignAllLeading,.alignAllTrailing], metrics: metrics, views: views))
        forgotPasswordLabel.centerXAnchor.constraint(equalTo: scrollViewHolder.centerXAnchor).isActive = true
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[loginButton]-littleSpace-[forgotPasswordLabel]", options: [], metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(contraints)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Đăng Nhập"
        self.navigationController?.navigationBar.isHidden = false
    }
    
}
extension LoginPresent : KeyboardNotifaction {
    func keyboardChange(isShow : Bool,adjustHeight : CGFloat){
        if isShow && scrollView.contentSize.height <= view.frame.height{
           scrollView.contentSize.height = scrollView.contentSize.height + adjustHeight/2
        }
        if(!isShow){
            scrollView.contentSize.height = view.frame.height - navigationHeight
        }
        
    }
}













