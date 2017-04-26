//
//  OTPVerifyView.swift
//  HITRUM
//
//  Created by SSd on 4/26/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class OTPVerifyView : OTPVerifyPresent {

       
    override func viewDidLoad() {
        super.viewDidLoad()
        setNotificationKeyboard(keyboardNotification: self)
        view.backgroundColor = UIColor.white
        otpWidth = (view.frame.width - margin*2 - padding*5) / 6
        phoneNumber = "+84938772819"
        initView()
    }
    
    func initView(){
        initViewData()
        addConstraint()
    }
    
    func initViewData(){
        scrollView.frame = view.bounds
        scrollView.showsVerticalScrollIndicator = false
        scrollViewHolder.frame = scrollView.frame
        scrollView.contentSize.height = view.frame.height - navigationHeight
        
        alertLabel.text = "Nhập mã xác nhận gồm 6 kí tự đã gửi đến số điện thoại \(phoneNumber)"
        alertLabel.numberOfLines = 0
        alertLabel.sizeToFit()
        alertLabel.translatesAutoresizingMaskIntoConstraints = false
        
        otp1.placeholder = "-"
        otp1.textAlignment = .center
        otp1.keyboardType = .numberPad
        otp1.translatesAutoresizingMaskIntoConstraints = false
        
        otp2.placeholder = "-"
        otp2.textAlignment = .center
        otp2.keyboardType = .numberPad
        otp2.translatesAutoresizingMaskIntoConstraints = false
        
        otp3.placeholder = "-"
        otp3.textAlignment = .center
        otp3.keyboardType = .numberPad
        otp3.translatesAutoresizingMaskIntoConstraints = false
        
        otp4.placeholder = "-"
        otp4.textAlignment = .center
        otp4.keyboardType = .numberPad
        otp4.translatesAutoresizingMaskIntoConstraints = false
        
        otp5.placeholder = "-"
        otp5.textAlignment = .center
        otp5.keyboardType = .numberPad
        otp5.translatesAutoresizingMaskIntoConstraints = false
        
        otp6.placeholder = "-"
        otp6.textAlignment = .center
        otp6.keyboardType = .numberPad
        otp6.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton.setTitle("Tiếp theo", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        requestOTPLabel.text = "Không nhận được mã ? "
        requestOTPLabel.numberOfLines = 0
        requestOTPLabel.sizeToFit()
        requestOTPLabel.translatesAutoresizingMaskIntoConstraints = false
        requestOTP.text = "Gửi lại mã"
        requestOTP.numberOfLines = 0
        requestOTP.sizeToFit()
        requestOTP.textColor = UIColor.appBaseColor()
        requestOTP.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewHolder)
        scrollViewHolder.addSubview(alertLabel)
        scrollViewHolder.addSubview(otp1)
        scrollViewHolder.addSubview(otp2)
        scrollViewHolder.addSubview(otp3)
        scrollViewHolder.addSubview(otp4)
        scrollViewHolder.addSubview(otp5)
        scrollViewHolder.addSubview(otp6)
        scrollViewHolder.addSubview(nextButton)
        scrollViewHolder.addSubview(requestOTPLabel)
        scrollViewHolder.addSubview(requestOTP)
       
    }
    
    func addConstraint(){
        let views : [String : Any] = ["alertLabel" : alertLabel,"otp1" :otp1,"otp2" :otp2,"otp3" : otp3,"otp4" :otp4,"otp5":otp5,"otp6" :otp6,"requestOTPLabel" :requestOTPLabel,"requestOTP" :requestOTP,"nextButton":nextButton]
        let metrics = ["spaceTop" :  40,"littleSpace" : 10,"normalSpace" : 30, "doubleSpace" :20,"lastNameLabelWidth" : 80,"buttonHeigh" : 50,"textFieldHeight" : 30, "otpWidth" : otpWidth, "otpHeight" : 40,"padding" : padding] as [String : Any]
        
        scrollView.frame = view.bounds
        scrollView.showsVerticalScrollIndicator = false
        scrollViewHolder.frame = scrollView.frame
        scrollView.contentSize.height = view.frame.height - navigationHeight
        
        let container = UILayoutGuide()
        var contraints = [NSLayoutConstraint]()
        scrollViewHolder.addLayoutGuide(container)
        container.topAnchor.constraint(equalTo: scrollViewHolder.topAnchor, constant: 40).isActive = true
        alertLabel.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
    
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[alertLabel]-normalSpace-|", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[alertLabel]-spaceTop-[otp1]", options: [.alignAllLeading], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[otp1(==otpWidth)]", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[otp1]-padding-[otp2(==otpWidth)]-padding-[otp3(==otpWidth)]-padding-[otp4(==otpWidth)]-padding-[otp5(==otpWidth)]-padding-[otp6(==otpWidth)]", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[otp1]-spaceTop-[nextButton(==buttonHeigh)]", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[nextButton]-normalSpace-|", options: [], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[nextButton]-normalSpace-[requestOTPLabel]", options: [.alignAllLeading], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[requestOTPLabel]-littleSpace-[requestOTP]", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        
        
        NSLayoutConstraint.activate(contraints)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Nhập mã xác nhận"
    }
    
}
extension OTPVerifyView : KeyboardNotifaction {
    func keyboardChange(isShow : Bool,adjustHeight : CGFloat){
        if isShow && scrollView.contentSize.height <= view.frame.height{
            scrollView.contentSize.height = scrollView.contentSize.height + adjustHeight/2
        }
        if(!isShow){
            scrollView.contentSize.height = view.frame.height - navigationHeight
        }
        
    }
}
