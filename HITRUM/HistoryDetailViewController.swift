//
//  HistoryViewController.swift
//  HITRUM
//
//  Created by SSd on 4/28/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class HistoryDetailViewController: HistoryDetailPresent {

    let percentTop : CGFloat = 2/5
    var topHeight : CGFloat = 0
    let topView = UIView()
    let buttomHigh : CGFloat = 0
    let seprateSpace : CGFloat = 10
    let historyDetailCollection = HistoryDetailCollectionView(collectionViewLayout: UICollectionViewFlowLayout())
    
    let priceTotalLabel = UILabel()
    let priceTotalContent = UILabel()
    let seprateView = UIView()
    let addressLabel = UILabel()
    let addressContent = UILabel()
    let timeLabel = UILabel()
    let timeContentLabel = UILabel()
    let timeTotalLabel = UILabel()
    let timeTotalContent = UILabel()
    let commentLabel = UILabel()
    let commentContentLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.tintBackgroundColor()
        topView.backgroundColor = UIColor.white
        topHeight = view.frame.height * percentTop
        topView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: topHeight)
        view.addSubview(topView)
        historyDetailCollection.view.frame = CGRect(x: 0, y: topHeight + 10, width: view.frame.width, height: view.frame.height-(topHeight + 10))
        historyDetailCollection.collectionView?.backgroundColor = UIColor.white
        addCollectionViewController(collectionView: historyDetailCollection)
        initHeaderLayout()
        addHeaderContraint()
    }

    func initHeaderLayout(){
        seprateView.translatesAutoresizingMaskIntoConstraints = false
        seprateView.backgroundColor = UIColor.tintBackgroundColor()
        
        priceTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        priceTotalLabel.text = NSLocalizedString("price_total", comment: "")
        priceTotalLabel.font = UIFont(name: priceTotalLabel.font.fontName, size: 20)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.text = NSLocalizedString("history_address", comment: "")
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.text = NSLocalizedString("history_time", comment: "")
        timeTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        timeTotalLabel.text = NSLocalizedString("history_time_total", comment: "")
        commentLabel.text = NSLocalizedString("comment", comment: "")
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        priceTotalContent.translatesAutoresizingMaskIntoConstraints = false
        priceTotalContent.text = "220.000đ"
        priceTotalContent.textAlignment = .right
        priceTotalContent.font = UIFont(name: priceTotalContent.font.fontName, size: 20)
        
        addressContent.translatesAutoresizingMaskIntoConstraints = false
        addressContent.text = "1/2A Lê Lợi, P.5, Q.1"
        addressContent.textAlignment = .right
        timeContentLabel.translatesAutoresizingMaskIntoConstraints = false
        timeContentLabel.text = "14:30 24/04/2017"
        timeContentLabel.textAlignment = .right
        timeTotalContent.translatesAutoresizingMaskIntoConstraints = false
        timeTotalContent.text = "2 giờ"
        timeTotalContent.textAlignment = .right
        commentContentLabel.translatesAutoresizingMaskIntoConstraints = false
        commentContentLabel.text = "Rất tốt"
        commentContentLabel.textAlignment = .right
        
        topView.addSubview(priceTotalLabel)
        topView.addSubview(priceTotalContent)
        topView.addSubview(seprateView)
        topView.addSubview(addressLabel)
        topView.addSubview(addressContent)
        topView.addSubview(timeLabel)
        topView.addSubview(timeContentLabel)
        topView.addSubview(timeTotalLabel)
        topView.addSubview(timeTotalContent)
        topView.addSubview(commentLabel)
        topView.addSubview(commentContentLabel)
        
    }
    
    func addHeaderContraint(){
        
        var constraints = [NSLayoutConstraint]()
        
        let views = ["priceTotalLabel" :priceTotalLabel,"priceTotalContent" :priceTotalContent,"seprateView" :seprateView,"addressLabel" :addressLabel,"addressContent" :addressContent ,"timeLabel" :timeLabel,"timeContentLabel" :timeContentLabel,"timeTotalLabel":timeTotalLabel,"timeTotalContent" :timeTotalContent,"commentLabel" :commentLabel,"commentContentLabel" :commentContentLabel]
        let metrics = ["leftWidth" : 100,"spaceElement" : 20]
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[priceTotalLabel]", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[priceTotalLabel(leftWidth)]", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[priceTotalLabel]-[priceTotalContent]-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[priceTotalLabel]-20-[seprateView(1)]", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[seprateView]-|", options: [], metrics: metrics, views: views))
        
         constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[seprateView]-20-[addressLabel]", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[addressLabel(leftWidth)]", options: [], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[addressLabel]-[addressContent]-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[addressLabel]-spaceElement-[timeLabel]", options: [.alignAllTrailing,.alignAllLeading], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[timeLabel]-[timeContentLabel]-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[timeLabel]-spaceElement-[timeTotalLabel]", options: [.alignAllTrailing,.alignAllLeading], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[timeTotalLabel]-[timeTotalContent]-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
//
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[timeTotalLabel]-spaceElement-[commentLabel]", options: [.alignAllTrailing,.alignAllLeading], metrics: metrics, views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[commentLabel]-[commentContentLabel]-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
        
        
        
        NSLayoutConstraint.activate(constraints)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func addCollectionViewController( collectionView: UIViewController) {
        collectionView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView.view)
        addChildViewController(collectionView)
        collectionView.didMove(toParentViewController: self)
        
    }


}
