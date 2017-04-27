//
//  EditPresent.swift
//  HITRUM
//
//  Created by SSd on 4/27/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class EditPresent: BaseViewController {
    let avatarWidth = 90
    let viewHeaderHeigh = 60
    
    let avatar : CustomImage = {
        let imageView = CustomImage()
        imageView.image = #imageLiteral(resourceName: "default_image")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = CGFloat(90/2)
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let viewHeader = UIView()
    
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
    
    let nextButton = UIButton.activeButtonWithOutRadius()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.addTarget(self, action: #selector(self.backHome), for: .touchUpInside)
    }
    
    func backHome(){
        navigationController?.popToRootViewController(animated: true)
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
