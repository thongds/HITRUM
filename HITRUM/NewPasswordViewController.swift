//
//  NewPasswordViewController.swift
//  HITRUM
//
//  Created by SSd on 4/30/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class NewPasswordViewController: NewsDetailPresent {

    let newPasswordLabel = UILabel()
    let newPasswordTextField = UITextField()
    let reNewPasswordLabel = UILabel()
    let reNewPasswordTextField = UITextField()
    let nextButton = UIButton.activeButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        initView()
        // Do any additional setup after loading the view.
    }

    func initView(){
        initViewData()
        initViewConstraint()
    }
    
    func initViewData(){
        newPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        newPasswordLabel.textColor = UIColor.tintColor()
        newPasswordLabel.text = NSLocalizedString("new_password_label", comment: "")
        
        reNewPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        reNewPasswordLabel.textColor = UIColor.tintColor()
        reNewPasswordLabel.text = NSLocalizedString("renew_password_label", comment: "")
        
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        newPasswordTextField.setBottomBorder()
        newPasswordTextField.isSecureTextEntry = true
        reNewPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        reNewPasswordTextField.setBottomBorder()
        reNewPasswordTextField.isSecureTextEntry = true
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle(NSLocalizedString("next_buttom_text", comment: ""), for: .normal)
        
        view.addSubview(newPasswordLabel)
        view.addSubview(newPasswordTextField)
        view.addSubview(reNewPasswordLabel)
        view.addSubview(reNewPasswordTextField)
        view.addSubview(nextButton)
        
    }
    
    func initViewConstraint(){
        var constraints = [NSLayoutConstraint]()
        
        let views = ["newPasswordLabel" : newPasswordLabel,"reNewPasswordLabel" : reNewPasswordLabel,"newPasswordTextField" : newPasswordTextField,"reNewPasswordTextField" : reNewPasswordTextField,"nextButton" :nextButton]
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[newPasswordLabel]-|", options: [], metrics: nil, views: views))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-60-[newPasswordLabel]-[newPasswordTextField]-20-[reNewPasswordLabel]-[reNewPasswordTextField]-40-[nextButton(60)]", options: [.alignAllLeading,.alignAllTrailing], metrics: nil, views: views))

        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = NSLocalizedString("new_password_title", comment: "")
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
