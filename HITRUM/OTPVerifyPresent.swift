//
//  OTPVerifyPresent.swift
//  HITRUM
//
//  Created by SSd on 4/26/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class OTPVerifyPresent : BaseViewController {
    
    
    var nextScreen : UIViewController?
    var isLastScreen : Bool = true
    var otpWidth : CGFloat = 0
    let padding : CGFloat = 10
    let margin : CGFloat = 30
    var phoneNumber = ""
    
    let alertLabel = UILabel()
    
    let otp1 = UITextField.underlineTextField()
    let otp2 = UITextField.underlineTextField()
    let otp3 = UITextField.underlineTextField()
    let otp4 = UITextField.underlineTextField()
    let otp5 = UITextField.underlineTextField()
    let otp6 = UITextField.underlineTextField()
    
    let nextButton = UIButton.activeButton()
    
    let requestOTPLabel = UILabel()
    let requestOTP = UILabel()
    let scrollView = UIScrollView()
    let scrollViewHolder = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.addTarget(self, action: #selector(self.validate), for: .touchUpInside)
    }
    
    func validate(){
        if let nextScreen = nextScreen {
            if isLastScreen {
                navigationController?.setViewControllers([nextScreen], animated: false)
            }else{
                navigationController?.pushViewController(nextScreen, animated: true)
            }
        }
    }

}
