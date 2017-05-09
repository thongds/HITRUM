//
//  RemarkViewController.swift
//  HITRUM
//
//  Created by SSd on 5/8/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class RemarkViewController: RemarkPresent {

    let scrollView  = UIScrollView()
    let scrollViewHolder = UIView()
    let remarkTitle = UILabel()
    
    let starRemak = StarRemark()
    
    let commentTitle = UILabel()
    let commentTextField = UITextField()
    
    let remarkButtom = UIButton.activeButton()
    
    let starIco = UIImageView(image: #imageLiteral(resourceName: "star_enable"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNotificationKeyboard(keyboardNotification : self)
        
        let btn = UIBarButtonItem(image: #imageLiteral(resourceName: "close_ico_white"), style: .plain, target: self, action: #selector(self.close))
        
        navigationItem.setLeftBarButton(btn, animated: true)
        
        view.backgroundColor = UIColor.white
        scrollView.frame = view.bounds
        scrollView.frame.size.height = view.bounds.size.height - navigationHeight
        scrollView.showsVerticalScrollIndicator = false
        scrollViewHolder.frame = scrollView.frame
        scrollView.contentSize.height = view.frame.height - navigationHeight
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewHolder)
        
        scrollViewHolder.addSubview(remarkTitle)
        scrollViewHolder.addSubview(starRemak)
        scrollViewHolder.addSubview(commentTitle)
        scrollViewHolder.addSubview(commentTextField)
        scrollViewHolder.addSubview(remarkButtom)
        
        remarkTitle.translatesAutoresizingMaskIntoConstraints = false
        remarkTitle.text = "1. " + NSLocalizedString("remark_title", comment: "")
        
        
        remarkTitle.topAnchor.constraint(equalTo: scrollViewHolder.topAnchor, constant: 50).isActive = true
        remarkTitle.leadingAnchor.constraint(equalTo: scrollViewHolder.leadingAnchor, constant: 20).isActive = true
        
        let remarkWidth = 40 + starIco.frame.width*5
        starRemak.frame = CGRect(x: (scrollViewHolder.frame.width - remarkWidth)/2, y: 100, width: remarkWidth, height: 50 )
        
        
        commentTitle.translatesAutoresizingMaskIntoConstraints = false
        commentTitle.text = "2. " + NSLocalizedString("remark_comment_title", comment: "")
        commentTitle.topAnchor.constraint(equalTo: remarkTitle.bottomAnchor, constant: 100).isActive = true
        commentTitle.leadingAnchor.constraint(equalTo: remarkTitle.leadingAnchor).isActive = true
        
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.setBottomBorder()
        commentTextField.topAnchor.constraint(equalTo: commentTitle.bottomAnchor, constant: 20).isActive = true
        commentTextField.leadingAnchor.constraint(equalTo: scrollViewHolder.leadingAnchor, constant: 20).isActive = true
        commentTextField.trailingAnchor.constraint(equalTo: scrollViewHolder.trailingAnchor, constant: -20).isActive = true
        
        remarkButtom.translatesAutoresizingMaskIntoConstraints = false
        remarkButtom.setTitle(NSLocalizedString("remark_buttom_title", comment: ""), for: .normal)
        remarkButtom.bottomAnchor.constraint(equalTo: scrollViewHolder.bottomAnchor, constant: -10).isActive = true
        remarkButtom.leadingAnchor.constraint(equalTo: scrollViewHolder.leadingAnchor, constant: 20).isActive = true
        remarkButtom.trailingAnchor.constraint(equalTo: scrollViewHolder.trailingAnchor , constant: -20).isActive = true
        remarkButtom.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    func close(){
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension RemarkViewController : KeyboardNotifaction {
    func keyboardChange(isShow : Bool,adjustHeight : CGFloat){
        if isShow && scrollView.contentSize.height <= view.frame.height{
            scrollView.contentSize.height = scrollView.contentSize.height + adjustHeight + 50
            //scrollView.contentOffset = CGPoint(x: 0, y: adjustHeight)
        }
        if(!isShow){
            scrollView.contentOffset = CGPoint(x: 0, y: 0)
            scrollView.contentSize.height = view.frame.height - navigationHeight
        }
        
    }
}
