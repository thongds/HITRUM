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
        nextButton.addTarget(self, action: #selector(self.showVerifyOTP), for: .touchUpInside)
    }
    
    func showVerifyOTP(){
        let otp = OTPVerifyView()
        let nextViewController = SuccessFullPageViewController()
        nextViewController.setData(successMessage: NSLocalizedString("register_success", comment: ""), nextViewController: UserHomeViewController())
        otp.setNextScreen(nextScreen: nextViewController, isLastScreen: true)
        navigationController?.pushViewController(otp, animated: true)
    }

}
