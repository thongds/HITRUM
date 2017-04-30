//
//  ChooseLocationViewController.swift
//  HITRUM
//
//  Created by SSd on 4/30/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class ChooseLocationViewController: ChooseLocationPresent {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(hexString: "#FAFAFA")
        initView()
    }
    
    func initView(){
        initViewData()
        addViewConstraint()
    }
    
    func initViewData(){
        searchView.backgroundColor = UIColor.white
        searchIco.translatesAutoresizingMaskIntoConstraints = false
        clearIco.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchView)
        
        searchView.addSubview(searchTextField)
        searchView.addSubview(searchIco)
        searchView.addSubview(clearIco)
        addCollectionViewController(collectionView: self.searchResultCollectionView)
    }
    
    func addViewConstraint(){
        searchView.frame = CGRect(x: 10, y: 20, width: view.frame.width - 20, height: 60)
        searchResultCollectionView.view.frame = CGRect(x: 10, y: searchView.frame.origin.y + 60 + 20, width: view.frame.width - 20, height: view.frame.height - (20 + 60+20))
        let views = ["searchView" : searchView,"searchIco" : searchIco,"clearIco" : clearIco,"searchTextField" : searchTextField] as [String : Any]
        let metrics = ["searchIcoWidth" : searchIco.frame.width,"clearIcoWidth" : clearIco.frame.width]
        searchIco.centerYAnchor.constraint(equalTo: searchView.centerYAnchor).isActive = true
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[searchIco(searchIcoWidth)]-[searchTextField]-[clearIco(clearIcoWidth)]-|", options: [.alignAllLastBaseline], metrics: metrics, views: views))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.title = NSLocalizedString("choose_location_page_title", comment: "")
    }
    
    fileprivate func addCollectionViewController( collectionView: UIViewController) {
        collectionView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView.view)
        addChildViewController(collectionView)
        collectionView.didMove(toParentViewController: self)
        
    }

}
