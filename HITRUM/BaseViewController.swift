//
//  BaseViewController.swift
//  HITRUM
//
//  Created by SSd on 4/26/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

protocol KeyboardNotifaction {
    func keyboardChange(isShow : Bool,adjustHeight : CGFloat)
}
class BaseViewController : UIViewController {

    var navigationHeight : CGFloat = 0
    var keyboardNotification : KeyboardNotifaction? = nil
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.topItem?.title = " "
        navigationHeight = (navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height
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
    }
}
