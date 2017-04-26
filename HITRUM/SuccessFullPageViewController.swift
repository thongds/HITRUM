//
//  SuccessFullPageViewController.swift
//  HITRUM
//
//  Created by SSd on 4/26/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class SuccessFullPageViewController: UIViewController {

    var successMessage : String = ""
    var nextViewController : UIViewController?
    
    let successImageView = UIImageView(image: #imageLiteral(resourceName: "success_ico"))
    let successMessageLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        initView()
    }

    func initView(){
        initViewData()
        addConstraint()
    }
    
    func initViewData(){
        successMessageLabel.text = successMessage
        successMessageLabel.numberOfLines = 0
        successMessageLabel.sizeToFit()
        successMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        successImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(successImageView)
        view.addSubview(successMessageLabel)
    }
    
    func addConstraint(){
        successImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        successImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        successMessageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        successMessageLabel.topAnchor.constraint(equalTo: successImageView.bottomAnchor, constant: 20).isActive = true
    }
    public func setData(successMessage : String , nextViewController : UIViewController){
        self.successMessage = successMessage
        self.nextViewController = nextViewController
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.showController), userInfo: nil, repeats: false)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

    func showController(){
        
        if let nextViewController = nextViewController{
            navigationController?.setViewControllers([nextViewController], animated: true)
        }
        //self.navigationController?.pushViewController(homeUnuser, animated: true)
    }
    
}
