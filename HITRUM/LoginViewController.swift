//
//  LoginViewController.swift
//  HITRUM
//
//  Created by SSd on 4/23/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let colorGreen = UIColor.init(hexString: "#6ED313")
    let facebookColor = UIColor.init(hexString: "#3B5898")
    let colorTint = UIColor.init(hexString: "#C7C7C7")
    let unLoginColor = UIColor.init(hexString: "#B7E989")
    
    let loginFacebook = UIButton()
    let orLabelCenter = UILabel()
    let line1 = UIView()
    let line2 = UIView()
    let phoneCode = UILabel()
    let phoneNumber = UITextField()
    let password = UITextField()
    let loginButton = UIButton()
    let forgotPasswordLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationItem.title = "Đăng Nhập"
        initLayout()
        
    }

    func initLayout(){
        let navigationHeight = (navigationController?.navigationBar.frame.height)! + UIApplication.shared.statusBarFrame.height
        
        orLabelCenter.text = "hoặc"
        orLabelCenter.textColor = colorTint
        orLabelCenter.translatesAutoresizingMaskIntoConstraints = false
        
        loginFacebook.translatesAutoresizingMaskIntoConstraints = false
        loginFacebook.setTitle("Đăng nhập qua Facebook", for: .normal)
        loginFacebook.layer.backgroundColor = facebookColor.cgColor
        loginFacebook.layer.cornerRadius = 5
        loginFacebook.setImage(#imageLiteral(resourceName: "facebook_ico"), for: .normal)
        loginFacebook.imageEdgeInsets.right = 20
        
        line1.translatesAutoresizingMaskIntoConstraints = false
        line1.backgroundColor = colorTint
        line2.translatesAutoresizingMaskIntoConstraints = false
        line2.backgroundColor = colorTint
        
        phoneCode.translatesAutoresizingMaskIntoConstraints = false
        phoneCode.text = "+84"
        
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        phoneNumber.placeholder = "Số điện thoại"
        phoneNumber.setBottomBorder()
        
        password.translatesAutoresizingMaskIntoConstraints = false
        password.isSecureTextEntry = true
        password.placeholder = "Mật Khẩu"
        password.setBottomBorder()
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.layer.cornerRadius = 5
        loginButton.setTitle("Đăng Nhập", for: .normal)
        loginButton.backgroundColor = unLoginColor
        
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordLabel.text = "Quên mật khẩu ?"
        forgotPasswordLabel.textColor = UIColor.init(hexString: "#8FDD49")
        
        view.addSubview(loginFacebook)
        view.addSubview(orLabelCenter)
        view.addSubview(line2)
        view.addSubview(line1)
        view.addSubview(phoneCode)
        view.addSubview(phoneNumber)
        view.addSubview(password)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordLabel)
        let fb_seprate_space = 30
        let views : [String : Any] = ["loginFacebook" : loginFacebook,"orLabelCenter" :orLabelCenter,"line1" :line1,"line2" : line2,"phoneCode" :phoneCode,"phoneNumber":phoneNumber,"password" :password,"loginButton" :loginButton,"forgotPasswordLabel" :forgotPasswordLabel]
        let metrics = ["loginFacebookSpaceTop" : navigationHeight + 40,"littleSpace" : 10,"normalSpace" : fb_seprate_space, "doubleSpace" :fb_seprate_space+10,"buttonHeigh" : 50] as [String : Any]
        
        let container = UILayoutGuide()
        var contraints = [NSLayoutConstraint]()
        view.addLayoutGuide(container)
        container.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationHeight + 40).isActive = true
        loginFacebook.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[loginFacebook]-normalSpace-|", options: [], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[loginFacebook(==buttonHeigh)]", options: [], metrics: metrics, views: views))
        contraints.append(orLabelCenter.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[loginFacebook]-normalSpace-[orLabelCenter]", options: [], metrics: metrics, views: views))
        line1.topAnchor.constraint(equalTo: orLabelCenter.topAnchor,constant : 10).isActive = true
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[line1]-littleSpace-[orLabelCenter]", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[line1(==1)]", options: [], metrics: metrics, views: views))
        line2.topAnchor.constraint(equalTo: orLabelCenter.topAnchor,constant : 10).isActive = true
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[orLabelCenter]-littleSpace-[line2]-normalSpace-|", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[line2(==1)]", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[orLabelCenter]-normalSpace-[phoneCode]", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[phoneCode]-littleSpace-[phoneNumber]-normalSpace-|", options: [.alignAllFirstBaseline], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[phoneCode]-normalSpace-[password]", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[password]-normalSpace-|", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[password]-normalSpace-[loginButton(==buttonHeigh)]", options: [.alignAllLeading,.alignAllTrailing], metrics: metrics, views: views))
        forgotPasswordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[loginButton]-littleSpace-[forgotPasswordLabel]", options: [], metrics: metrics, views: views))
        
        NSLayoutConstraint.activate(contraints)
        
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
