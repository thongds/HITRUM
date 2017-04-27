//
//  NewsViewController.swift
//  HITRUM
//
//  Created by SSd on 4/27/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class NewsViewController: NewsPresent, UITableViewDelegate, UITableViewDataSource {
    
    let identify  = "news_cell"
    let tableView = UITableView()
    var newsData = [NewsModel]()
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.register(NewsCellTableViewCell.self, forCellReuseIdentifier: identify)
        
        tableView.contentOffset = CGPoint(x: 0, y: -20)
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        super.viewDidLoad()
        for _ in 0...10 {
            newsData.append(NewsModel(title: "Khuyến mãi hôm nay", content:"Tham gia đặt người giúp việc ngay hôm nay để được" , date:"13/04/2017" ))
        }
        initLayout()
    }

    func initLayout(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        let views = ["tableView" : tableView]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[tableView]-|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[tableView]-|", options: [], metrics: nil, views: views))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as! NewsCellTableViewCell
        return cell
    }

}
