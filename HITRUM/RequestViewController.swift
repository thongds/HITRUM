//
//  RequestViewController.swift
//  HITRUM
//
//  Created by SSd on 5/1/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class RequestViewController: RequestPresent {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNotificationKeyboard(keyboardNotification : self)
        view.backgroundColor = UIColor.white
        initView()
        initButtomView()
    }
    
    func initView(){
        
        scrollView.frame = view.bounds
        scrollView.frame.size.height = view.bounds.size.height - navigationHeight
        scrollView.showsVerticalScrollIndicator = false
        scrollViewHolder.frame = scrollView.frame
        scrollView.contentSize.height = view.frame.height - navigationHeight
        
        requestLocationView.translatesAutoresizingMaskIntoConstraints = false
        requestLocationView.backgroundColor = UIColor.white
        requestLocationView.layer.cornerRadius = 5
        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        requestLocationDotImage.translatesAutoresizingMaskIntoConstraints = false
        requestLabel.text = "150 Minh Phụng, Phường 5, Quận 11"
        
        requestButtomArea.frame = CGRect(x: 0, y: view.frame.height - navigationHeight - requestButtomAreaCloseHeight, width: view.frame.width, height: requestButtomAreaCloseHeight)
        requestButtomArea.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewHolder)
        
        scrollViewHolder.addSubview(mapKit)
        scrollViewHolder.addSubview(requestLocationView)
        scrollViewHolder.addSubview(requestButtomArea)
        scrollViewHolder.addSubview(dropdownBigIco)
        
        requestButton.translatesAutoresizingMaskIntoConstraints = false
        scrollViewHolder.addSubview(requestButton)
        requestButton.setTitle(NSLocalizedString("request_button_label", comment: ""), for: .normal)
        
        let scrollViewHolderViews = ["requestButton" : requestButton]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[requestButton(60)]-|", options: [], metrics: nil, views: scrollViewHolderViews))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[requestButton]-|", options: [], metrics: nil, views: scrollViewHolderViews))
        
        requestLocationView.addSubview(requestLocationDotImage)
        requestLocationView.addSubview(requestLabel)
        
        
        let views = ["mapkit" : mapKit,"requestLocationView" : requestLocationView,"requestLabel" : requestLabel,"requestLocationDotImage" : requestLocationDotImage]
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[mapkit]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[mapkit]|", options: [], metrics: nil, views: views))
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[requestLocationView(60)]", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[requestLocationView]-|", options: [], metrics: nil, views: views))
        requestLocationDotImage.centerYAnchor.constraint(equalTo: requestLocationView.centerYAnchor).isActive = true
        requestLocationDotImage.leadingAnchor.constraint(equalTo: requestLocationView.leadingAnchor, constant: 10).isActive = true
        requestLocationDotImage.widthAnchor.constraint(equalToConstant: requestLocationDotImage.frame.width).isActive = true
        requestLabel.centerYAnchor.constraint(equalTo: requestLocationView.centerYAnchor).isActive = true
        requestLabel.leadingAnchor.constraint(equalTo: requestLocationDotImage.trailingAnchor, constant: 10).isActive = true
        requestLabel.trailingAnchor.constraint(equalTo: requestLocationView.trailingAnchor, constant: -10).isActive = true
        
    }
    
    func initButtomView(){
        
        
//        requestButtomArea.translatesAutoresizingMaskIntoConstraints = false
//        requestButtomArea.backgroundColor = UIColor.white
//        
//        requestButtomArea.heightAnchor.constraint(equalToConstant: requestButtomAreaHeight).isActive = true
//        requestButtomArea.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        requestButtomArea.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        requestButtomArea.lastBaselineAnchor.constraint(equalTo: view.lastBaselineAnchor).isActive = true
        // dropdown Big Ico
        dropdownBigIco.translatesAutoresizingMaskIntoConstraints = false
        dropdownBigIco.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dropdownBigIco.bottomAnchor.constraint(equalTo: requestButtomArea.topAnchor, constant: -10).isActive = true
        
        initRequestButtonLayout()
    }
    
    func initRequestButtonLayout(){
        priceLabel.text = "550,000đ"
        headerBackground.backgroundColor = UIColor.init(hexString: "#FAFAFA")
        peopleSelectedLabel.text = "5 người"
        peopelUnderline.backgroundColor = UIColor.tintColor()
        requestButtomArea.addSubview(headerBackground)
        requestButtomArea.addSubview(priceLabel)
        requestButtomArea.addSubview(castIco)
        requestButtomArea.addSubview(infoIco)
        
        
        headerBackground.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        castIco.translatesAutoresizingMaskIntoConstraints = false
        infoIco.translatesAutoresizingMaskIntoConstraints = false
        
        //people
        multiPeopleIco.translatesAutoresizingMaskIntoConstraints = false
        peopleSelectedLabel.translatesAutoresizingMaskIntoConstraints = false
        peopleDropDowSmallIco.translatesAutoresizingMaskIntoConstraints = false
        peopelUnderline.translatesAutoresizingMaskIntoConstraints = false
        
        requestButtomArea.addSubview(multiPeopleIco)
        requestButtomArea.addSubview(peopleSelectedLabel)
        requestButtomArea.addSubview(peopleDropDowSmallIco)
        requestButtomArea.addSubview(peopelUnderline)
        //clock
        clockUnderLine.backgroundColor = UIColor.tintColor()
        clockSelectedLabel.text = "2 giờ"
        clockIco.translatesAutoresizingMaskIntoConstraints = false
        clockSelectedLabel.translatesAutoresizingMaskIntoConstraints = false
        clockDropDownSmallIco.translatesAutoresizingMaskIntoConstraints = false
        clockUnderLine.translatesAutoresizingMaskIntoConstraints = false
        
        requestButtomArea.addSubview(clockIco)
        requestButtomArea.addSubview(clockSelectedLabel)
        requestButtomArea.addSubview(clockDropDownSmallIco)
        requestButtomArea.addSubview(clockUnderLine)
        //generate
        generateUnderline.backgroundColor = UIColor.tintColor()
        generateLabel.text = "Nam"
        generateUnderline.translatesAutoresizingMaskIntoConstraints = false
        generateLabel.translatesAutoresizingMaskIntoConstraints = false
        generateIco.translatesAutoresizingMaskIntoConstraints = false
        generateDropDownIco.translatesAutoresizingMaskIntoConstraints = false
        
        requestButtomArea.addSubview(generateUnderline)
        requestButtomArea.addSubview(generateLabel)
        requestButtomArea.addSubview(generateDropDownIco)
        requestButtomArea.addSubview(generateIco)
        //gift
        giftUnderline.translatesAutoresizingMaskIntoConstraints = false
        giftUnderline.backgroundColor = UIColor.tintColor()
        giftIco.translatesAutoresizingMaskIntoConstraints = false
        giftTextField.translatesAutoresizingMaskIntoConstraints = false
        giftTextField.placeholder = NSLocalizedString("gift_placeholder", comment: "")
        
        requestButtomArea.addSubview(giftUnderline)
        requestButtomArea.addSubview(giftTextField)
        requestButtomArea.addSubview(giftIco)
        
        //note 
        noteIco.translatesAutoresizingMaskIntoConstraints = false
        noteUnderline.translatesAutoresizingMaskIntoConstraints = false
        noteTextField.translatesAutoresizingMaskIntoConstraints = false
        noteUnderline.backgroundColor = UIColor.tintColor()
        noteTextField.placeholder = NSLocalizedString("note_placeholder", comment: "")
        
        requestButtomArea.addSubview(noteIco)
        requestButtomArea.addSubview(noteUnderline)
        requestButtomArea.addSubview(noteTextField)
        
        //request button
        
//        requestButton.translatesAutoresizingMaskIntoConstraints = false
//        requestButton.setTitle(NSLocalizedString("request_button_label", comment: ""), for: .normal)
//        requestButtomArea.addSubview(requestButton)
        
        let views = ["priceLabel" :priceLabel,"castIco" : castIco,"infoIco":infoIco,"headerBackground" :headerBackground,"multiPeopleIco" :multiPeopleIco,"peopleSelectedLabel" :peopleSelectedLabel,"peopleDropDowSmallIco" :peopleDropDowSmallIco,"peopelUnderline" :peopelUnderline,"clockIco" :clockIco,"clockSelectedLabel" :clockSelectedLabel,"clockDropDownSmallIco" :clockDropDownSmallIco,"clockUnderLine" :clockUnderLine,"generateUnderline" :generateUnderline ,"generateLabel" :generateLabel,"generateIco" :generateIco,"generateDropDownIco":generateDropDownIco,"giftUnderline" :giftUnderline,"giftIco":giftIco,"giftTextField" :giftTextField,"noteIco":noteIco,"noteUnderline":noteUnderline,"noteTextField":noteTextField,"requestButton":requestButton]
        
        let metrics  = ["leftWidth" : leftWidth,"spaceBetweenItem" : 40,"giftIcoWidth" : giftIco.frame.width,"noteIcoWidth":noteIco.frame.width]
        
        priceLabel.centerXAnchor.constraint(equalTo: requestButtomArea.centerXAnchor).isActive = true
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[headerBackground(40)]", options: [], metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[headerBackground]|", options: [], metrics: nil, views: views))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-[priceLabel]", options: [], metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[castIco]-[priceLabel]", options: [.alignAllLastBaseline], metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-[infoIco]", options: [], metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[priceLabel]-[infoIco]", options: [], metrics: nil, views: views))
        
        //people 
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[headerBackground]-20-[multiPeopleIco]", options: [], metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[multiPeopleIco]-[peopleSelectedLabel]", options: [.alignAllLastBaseline], metrics: nil, views: views))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[multiPeopleIco]-8-[peopelUnderline(1)]", options: [], metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[peopelUnderline(leftWidth)]", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[peopleDropDowSmallIco]-8-[peopelUnderline]", options: [.alignAllTrailing], metrics: metrics, views: views))
        
        //clock
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[peopelUnderline]-[clockUnderLine(leftWidth)]", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[clockUnderLine(1)]", options: [.alignAllLastBaseline], metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[clockIco]-8-[clockUnderLine]", options: [], metrics: nil, views: views))
        clockIco.leadingAnchor.constraint(equalTo: clockUnderLine.leadingAnchor, constant: 5).isActive = true
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[clockIco]-[clockSelectedLabel]", options: [.alignAllLastBaseline], metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[clockDropDownSmallIco]-8-[clockUnderLine]", options: [.alignAllTrailing], metrics: nil, views: views))
        
        
        //generate 
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[peopelUnderline]-spaceBetweenItem-[generateUnderline(1)]", options: [.alignAllLeading,.alignAllTrailing], metrics: metrics, views: views))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[generateIco]-8-[generateUnderline]", options: [], metrics: metrics, views: views))
        generateIco.leadingAnchor.constraint(equalTo: generateUnderline.leadingAnchor, constant: 5).isActive = true
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[generateIco]-[generateLabel]", options: [.alignAllLastBaseline], metrics: nil, views: views))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[generateDropDownIco]-8-[generateUnderline]", options: [.alignAllTrailing], metrics: nil, views: views))
        
        //gift
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[generateUnderline]-[giftUnderline]-|", options: [.alignAllLastBaseline], metrics: nil, views: views))
        giftUnderline.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[giftIco]-8-[generateUnderline]", options: [], metrics: nil, views: views))
        giftIco.leadingAnchor.constraint(equalTo: giftUnderline.leadingAnchor, constant: 5).isActive = true
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[giftIco(giftIcoWidth)]-[giftTextField]-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        
        //note
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[generateUnderline]-spaceBetweenItem-[noteUnderline(1)]", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[noteUnderline]-|", options: [], metrics: nil, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[noteIco]-8-[noteUnderline]", options: [], metrics: nil, views: views))
        noteIco.leadingAnchor.constraint(equalTo: noteUnderline.leadingAnchor, constant: 5).isActive = true
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[noteIco(noteIcoWidth)]-[noteTextField]-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        //request button
//        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[requestButton(40)]-|", options: [], metrics: nil, views: views))
//        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[requestButton]-|", options: [], metrics: nil, views: views))
    
        
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        self.title = NSLocalizedString("request_screen_title", comment: "")
    }
    
}
extension RequestViewController : KeyboardNotifaction {
    func keyboardChange(isShow : Bool,adjustHeight : CGFloat){
        if isShow && scrollView.contentSize.height <= view.frame.height{
            scrollView.contentSize.height = scrollView.contentSize.height + adjustHeight + 50
            scrollView.contentOffset = CGPoint(x: 0, y: adjustHeight)
        }
        if(!isShow){
            scrollView.contentOffset = CGPoint(x: 0, y: 0)
            scrollView.contentSize.height = view.frame.height - navigationHeight
        }
        
    }
}







































