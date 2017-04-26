//
//  MenuViewController.swift
//  HITRUM
//
//  Created by SSd on 4/26/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController {

    let viewHeader = UIView()
    let avatar = UIImageView.circleImageView()
    let namelabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
    }

    func initView(){
        addViewData()
        addViewContraint()
    }
    
    func addViewData(){
        
        viewHeader.backgroundColor = UIColor.appBaseColor()
        viewHeader.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 120)
        
        avatar.image = #imageLiteral(resourceName: "avatart")
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        namelabel.text = "Duong Son Thong thonglao thonglao thonglao"
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        namelabel.numberOfLines = 1
        namelabel.sizeToFit()
        namelabel.textColor = UIColor.white
        namelabel.lineBreakMode = .byTruncatingTail
        view.addSubview(viewHeader)
        viewHeader.addSubview(avatar)
        viewHeader.addSubview(namelabel)
    }
    
    func addViewContraint(){
       
        let views = ["nameLabel" : namelabel,"avatar": avatar]
        
       
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[avatar(60)]", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[avatar(60)]", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[avatar]-10-[nameLabel(==200)]", options: [], metrics: nil, views: views))
        avatar.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        namelabel.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
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
