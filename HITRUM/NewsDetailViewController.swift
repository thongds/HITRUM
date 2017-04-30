//
//  NewsDetailViewController.swift
//  HITRUM
//
//  Created by SSd on 4/27/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

class NewsDetailViewController: NewsDetailPresent {

    let imageHeader : CustomImage = {
        let imageView = CustomImage()
        imageView.image = #imageLiteral(resourceName: "default_image_loading")
        return imageView
    }()
    
    let newsTitle = UILabel()
    
    let newsContent = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        initView()
    }

    func initView(){
        initViewData()
        addViewConstraint()
    }
    
    func initViewData(){
        newsTitle.text = "Thông báo thay đổi cước"
        newsContent.text = "Công ty Rồng Xanh xin gửi tới Quý Khách lời chúc sức khỏe và lời cảm ơn chân thành nhất vì đã luôn quan tâm, tin tưởng và ủng hộ dịch vụ của Công ty Rồng Xanh trong suốt thời gian qua.Với sự nổ lực không ngừng nhằm mang đến sự hài lòng về những sản phẩm chất lượng và dịch vụ tốt nhất khi sử dụng dịch vụ của giao hàng online Rồng Xanh.Nay công ty Cổ Phần Tiếp Vận Quốc Tế Rồng Xanh xin gửi đến Quý khách hàng thông báo về việc thay đổi giá cước các gói cung cấp dịch vụ mới. (Chi tiết đính kèm trong file Phụ Lục Báo Giá).Thời gian áp dụng bắt đầu từ ngày 01/11/2016.Mọi thắc mắc để được hỗ trợ, xin vui lòng liên hệ đội ngũ sales Giao hàng nhanh online Rồng Xanh của chúng tôi để được tư vấn thêm.Rất mong Quý khách hàng sẽ tiếp tục ủng hộ và Công ty Rồng Xanh xin gửi tới Quý Khách lời chúc sức khỏe và lời cảm ơn chân thành nhất vì đã luôn quan tâm, tin tưởng và ủng hộ dịch vụ của Công ty Rồng Xanh trong suốt thời gian qua.Với sự nổ lực không ngừng nhằm mang đến sự hài lòng về những sản phẩm chất lượng và dịch vụ tốt nhất khi sử dụng dịch vụ của giao hàng online Rồng Xanh.Nay công ty Cổ Phần Tiếp Vận Quốc Tế Rồng Xanh xin gửi đến Quý khách hàng thông báo về việc thay đổi giá cước các gói cung cấp dịch vụ mới. (Chi tiết đính kèm trong file Phụ Lục Báo Giá).Thời gian áp dụng bắt đầu từ ngày 01/11/2016.Mọi thắc mắc để được hỗ trợ, xin vui lòng liên hệ đội ngũ sales Giao hàng nhanh online Rồng Xanh của chúng tôi để được tư vấn thêm.Rất mong Quý khách hàng sẽ tiếp tục ủng hộ và"
        newsContent.isUserInteractionEnabled = false
        
        imageHeader.translatesAutoresizingMaskIntoConstraints = false
        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        newsContent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageHeader)
        view.addSubview(newsTitle)
        view.addSubview(newsContent)
        
    }
    func addViewConstraint(){
        let views = ["imageHeader" :imageHeader,"newsTitle" : newsTitle,"newsContent" :newsContent]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageHeader(200)]", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageHeader]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[imageHeader]-20-[newsTitle]", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[newsTitle]-|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[newsTitle]-20-[newsContent]|", options: [.alignAllLeading,.alignAllTrailing], metrics: nil, views: views))
      
        
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
