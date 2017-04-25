//
//  HomeUnuserViewController.swift
//  HITRUM
//
//  Created by SSd on 4/23/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class HomeUnuserViewController: UIViewController {

    let splashImage = UIImageView(image: #imageLiteral(resourceName: "Splash"))
    let loginButtom = UIButton()
    let registerButtom = UIButton()
    let colorGreen = UIColor.init(hexString: "#6ED313")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLayout()
        loginButtom.addTarget(self, action: #selector(self.login), for: .touchUpInside)
    }
    
    func login(){
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    func initLayout(){
        view.backgroundColor = UIColor.white
        
        splashImage.translatesAutoresizingMaskIntoConstraints = false;
        loginButtom.translatesAutoresizingMaskIntoConstraints = false;
        registerButtom.translatesAutoresizingMaskIntoConstraints = false;
        
        loginButtom.setTitle("Đăng Nhập", for: .normal)
        loginButtom.backgroundColor = colorGreen
        
        loginButtom.layer.cornerRadius = 5
        registerButtom.setTitle("Đăng Kí", for: .normal)
        registerButtom.setTitleColor(colorGreen, for: .normal)
        registerButtom.backgroundColor = UIColor.white
        registerButtom.layer.cornerRadius = 5
        
        registerButtom.layer.borderColor = colorGreen.cgColor
        registerButtom.layer.borderWidth = 2
        
        
        view.addSubview(splashImage)
        view.addSubview(loginButtom)
        view.addSubview(registerButtom)
        
        var contraints = [NSLayoutConstraint]()
        
        contraints.append(splashImage.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        contraints.append(splashImage.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        let views = ["loginButton" : loginButtom,"registerButton" : registerButtom]
        let metrics = ["normalSpace" : 10,"HighSpace" : 20,"ButtonHeigh" : 60]
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[registerButton(==ButtonHeigh)]-HighSpace-|", options: [], metrics: metrics, views: views))
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-normalSpace-[registerButton]-normalSpace-|", options: [], metrics: metrics, views: views))
        
        contraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[loginButton(==ButtonHeigh)]-normalSpace-[registerButton]", options: [.alignAllLeading,.alignAllTrailing], metrics: metrics, views: views))
        
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
