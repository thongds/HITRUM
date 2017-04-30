//
//  LoginPresent.swift
//  HITRUM
//
//  Created by SSd on 4/25/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation
import UIKit


class LoginPresent : BaseViewController {
    
    let scrollView = UIScrollView()
    let scrollViewHolder = UIView()
    
    let loginFacebook = UIButton()
    let orLabelCenter = UILabel()
    let line1 = UIView()
    let line2 = UIView()
    let phoneCode = UILabel()
    let phoneNumber = UITextField()
    let password = UITextField()
    let loginButton = UIButton.disableButton()
    let forgotPasswordLabel = UILabel()
    
    override func viewDidLoad() {
        loginFacebook.addTarget(self, action: #selector(self.loginFacebookProcess), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.openForgotPassword))
        forgotPasswordLabel.addGestureRecognizer(tap)
    }
    
    func openForgotPassword(){
        navigationController?.pushViewController(ForgotPasswordViewController(), animated: true)
    }
        

    
    func loginFacebookProcess(){
        navigationController?.pushViewController(FacebookLoginView(), animated: true)
    }
}










