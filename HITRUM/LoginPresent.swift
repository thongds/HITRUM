//
//  LoginPresent.swift
//  HITRUM
//
//  Created by SSd on 4/25/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation
import UIKit

protocol KeyboardNotifaction {
    func keyboardChange(isShow : Bool,adjustHeight : CGFloat)
}
class LoginPresent : UIViewController {
    var navigationHeight : CGFloat = 0

    let colorGreen = UIColor.init(hexString: "#6ED313")
    let facebookColor = UIColor.init(hexString: "#3B5898")
    let colorTint = UIColor.init(hexString: "#C7C7C7")
    let unLoginColor = UIColor.init(hexString: "#B7E989")
    
    let scrollView = UIScrollView()
    let scrollViewHolder = UIView()
    
    let loginFacebook = UIButton()
    let orLabelCenter = UILabel()
    let line1 = UIView()
    let line2 = UIView()
    let phoneCode = UILabel()
    let phoneNumber = UITextField()
    let password = UITextField()
    let loginButton = UIButton()
    let forgotPasswordLabel = UILabel()
    
    
    var keyboardNotification : KeyboardNotifaction? = nil
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    public func setNotificationKeyboard(keyboardNotification : KeyboardNotifaction){
        self.keyboardNotification = keyboardNotification
    }
    
    func keyboardWillShow(notification: NSNotification) {
        adjustInsetForKeyboardShow(show: true, notification: notification)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        adjustInsetForKeyboardShow(show: false, notification: notification)
    }
    func adjustInsetForKeyboardShow(show: Bool, notification: NSNotification) {
        let userInfo = notification.userInfo ?? [:]
        let keyboardFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let adjustmentHeight = (keyboardFrame.height * (show ? 1 : -1)) + 20
        
        if let keyboardNotification = keyboardNotification {
            keyboardNotification.keyboardChange(isShow : show,adjustHeight: adjustmentHeight)
        }
//        fgScrollView.contentInset.bottom += adjustmentHeight
//        fgScrollView.scrollIndicatorInsets.bottom += adjustmentHeight
        
    }
}
