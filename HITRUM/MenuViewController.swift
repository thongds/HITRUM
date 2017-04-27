//
//  MenuViewController.swift
//  HITRUM
//
//  Created by SSd on 4/26/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class MenuViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    let viewHeader = UIView()
    let avatarWidth = 60
    let avatar : CustomImage = {
        let imageView = CustomImage()
        imageView.image = #imageLiteral(resourceName: "default_image")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = CGFloat(60/2)
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let namelabel = UILabel()
    let tableMenu = UITableView()
    
    let cellIdentify = "cell"
    var menuData = [MenuModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        tableMenu.rowHeight = 50
        tableMenu.delegate = self
        tableMenu.dataSource = self
        tableMenu.showsVerticalScrollIndicator = false
        tableMenu.register(CellMenu.self, forCellReuseIdentifier: cellIdentify)
        tableMenu.separatorStyle = .none
        initMenuData()
    }
    func initMenuData(){
        menuData.append(MenuModel(menuIco: UIImageView(image : #imageLiteral(resourceName: "schedule")), menuLabelString: "Lịch làm việc"))
        menuData.append(MenuModel(menuIco: UIImageView(image : #imageLiteral(resourceName: "news")), menuLabelString: "Tin Tức"))
        menuData.append(MenuModel(menuIco: UIImageView(image : #imageLiteral(resourceName: "introduce")), menuLabelString: "Giới thiệu"))
        menuData.append(MenuModel(menuIco: UIImageView(image : #imageLiteral(resourceName: "contact")), menuLabelString: "Hợp tác"))
        menuData.append(MenuModel(menuIco: UIImageView(image : #imageLiteral(resourceName: "setting")), menuLabelString: "Cài đặt"))
    }
    func initView(){
        addViewData()
        addViewContraint()
    }
    
    func addViewData(){
        
        viewHeader.backgroundColor = UIColor.appBaseColor()
        
        viewHeader.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 120)
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        namelabel.text = "Duong Son Thong thonglao thonglao thonglao"
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        namelabel.numberOfLines = 1
        namelabel.sizeToFit()
        namelabel.textColor = UIColor.white
        namelabel.lineBreakMode = .byTruncatingTail
        tableMenu.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(viewHeader)
        view.addSubview(tableMenu)
        viewHeader.addSubview(avatar)
        viewHeader.addSubview(namelabel)
        
    }
    
    func addViewContraint(){
       
        let views = ["viewHeader": viewHeader,"nameLabel" : namelabel,"avatar": avatar,"tableMenu" : tableMenu]
        let metrics = ["avatarWidth" :avatarWidth]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[avatar(avatarWidth)]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[avatar(avatarWidth)]", options: [], metrics: metrics, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[avatar]-10-[nameLabel(==150)]", options: [], metrics: nil, views: views))
        avatar.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        namelabel.centerYAnchor.constraint(equalTo: viewHeader.centerYAnchor).isActive = true
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[viewHeader]-20-[tableMenu]-|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[tableMenu]-|", options: [], metrics: nil, views: views))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentify, for: indexPath) as! CellMenu
        let menuModel = menuData[indexPath.item]
        cell.icon = menuModel.menuIco
        cell.menuName = menuModel.menuLabel
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.item {
        case 0:
            
            break
        case 1 :
            navigationController?.pushViewController(NewsCollectionView(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
            break
        case 2 :
            break
        case 3 :
            break
        case 4 :
            navigationController?.pushViewController(SettingViewController(), animated: true)
            break
        default: break
            
        }
   
    }
    
    
}
