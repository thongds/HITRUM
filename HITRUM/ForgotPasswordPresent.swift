//
//  ForgotPasswordPresent.swift
//  HITRUM
//
//  Created by SSd on 4/29/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class ForgotPasswordPresent: BaseViewController {
    
    let titleHeader = UILabel()
    let phoneCode = UILabel()
    let phoneNumber = UITextField()
    let nextButton = UIButton.activeButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.addTarget(self, action: #selector(self.showOTP), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }

    func showOTP(){
        let otp = OTPVerifyView()
        otp.setNextScreen(nextScreen: NewPasswordViewController(), isLastScreen: false)
        
        navigationController?.pushViewController(otp, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
