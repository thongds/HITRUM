//
//  FacebookLoginVerifyViewController.swift
//  HITRUM
//
//  Created by SSd on 4/25/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class FacebookLoginVerifyPresent: BaseViewController {

   
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
        view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = " "
        // Do any additional setup after loading the view.
    }

    

}
