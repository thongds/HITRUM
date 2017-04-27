//
//  CustomImage.swift
//  HITRUM
//
//  Created by SSd on 4/27/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import Foundation
import UIKit


class CustomImage: UIImageView {
    
    let imageCache = NSCache<AnyObject,AnyObject>()
    var imageUrl : String?
    func loadImageForUrl(_ urlString : String){
        imageUrl = urlString
        let url = URL(string: urlString)
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        if let url = url{
            URLSession.shared.dataTask(with: url, completionHandler: { (data, respones, error) in
                if error != nil {
                    self.image = #imageLiteral(resourceName: "default_image")
                    return
                }
                
                DispatchQueue.main.async(execute: {
                    if let data = data {
                        let imageToCache = UIImage(data: data)
                        
                        if let imageToCache = imageToCache{
                            self.image = imageToCache
                            self.imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                        }else{
                            self.image = #imageLiteral(resourceName: "default_image")
                            print(url)
                        }
                    }
                    
                })
            }).resume()
        }else{
            self.image = #imageLiteral(resourceName: "default_image")
        }
        
    }
    
}
