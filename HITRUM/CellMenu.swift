//
//  CellMenu.swift
//  HITRUM
//
//  Created by SSd on 4/27/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class CellMenu: UITableViewCell {

    var icon = UIImageView()
    var menuName = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        icon.translatesAutoresizingMaskIntoConstraints = false
        menuName.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(icon)
        self.contentView.addSubview(menuName)
        
        let views = ["icon" : icon, "menuName" : menuName] as [String : Any]
        
        icon.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        menuName.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:[icon]-10-[menuName]", options: [], metrics: nil, views: views))
        
    }

}

















