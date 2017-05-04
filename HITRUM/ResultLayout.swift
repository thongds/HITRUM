//
//  ResultLayout.swift
//  HITRUM
//
//  Created by SSd on 5/3/17.
//  Copyright © 2017 SSd. All rights reserved.
//

import UIKit

protocol NewsLayoutDelegate {
    func collectionView(_ collectionView : UICollectionView, heightForItemAtIndexPath indexPath: IndexPath) -> CGFloat
}


class ResultLayout: UICollectionViewFlowLayout {
    var delegate : NewsLayoutDelegate!
    var space : CGFloat = 10
    var cached : Bool = false
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    fileprivate var contentMaxHeight: CGFloat = 0
    var initFirstPos = false
    fileprivate var width : CGFloat{
        get {
            return collectionView!.bounds.width
        }
    }
    fileprivate var height : CGFloat{
        get {
            return collectionView!.frame.width
        }
    }
    
    override var collectionViewContentSize: CGSize{
        print("collection-> collectionViewContentSize \(max(504.0,contentMaxHeight))")
        return CGSize(width: width, height: max(504.0,contentMaxHeight))
    }
    
    var yOffset: CGFloat = 0
    override func prepare() {
        print("collection-> prepare")
        if cache.count == 0{
            let contentWidth = width
            //yOffset = space
            contentMaxHeight = 0
            let itemHeight : CGFloat = 100
            print("collectionView!.numberOfItems(inSection: 0) \(collectionView!.numberOfItems(inSection: 0))")
            for _ in 0..<collectionView!.numberOfItems(inSection: 0){
                
                contentMaxHeight += itemHeight + space
            }
            
            yOffset =  max(504.0,contentMaxHeight) - itemHeight - space
            
            for item in 0..<collectionView!.numberOfItems(inSection: 0){
                let indexPath = IndexPath(item: item, section: 0)
                let frame = CGRect(x: 0, y: yOffset, width: contentWidth, height: itemHeight)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = frame
                //attributes.contentHeight = 100
                cache.append(attributes)
                yOffset = yOffset - itemHeight - space
                cached = true
            }
            print("collection-> prepare contentOffset \(max(504.0,contentMaxHeight))")
            if(!initFirstPos){
                collectionView?.contentOffset = CGPoint(x: 0, y: max(504.0,contentMaxHeight))
                initFirstPos = true
            }
            
        }
    }
//    override func prepare() {
//        print("prepare")
//        if !cached{
//            let contentWidth = width
//            yOffset = space
//            for item in 0..<collectionView!.numberOfItems(inSection: 0){
//                let indexPath = IndexPath(item: item, section: 0)
//                let height : CGFloat = 100
//                let frame = CGRect(x: 0, y: yOffset, width: contentWidth, height: height)
//                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
//                attributes.frame = frame
//                //attributes.contentHeight = height
//                cache.append(attributes)
//                contentMaxHeight = max(contentMaxHeight,frame.maxY)
//                yOffset = yOffset + height + space
//                cached = true
//            }
//            
//        }
//    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        print("collection-> layoutAttributesForElements")
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            layoutAttributes.append(attributes)
//            if attributes.frame.intersects(rect) {
//                layoutAttributes.append(attributes)
//            }
        }
        return layoutAttributes
    }
   
    func deleteCache(){
        cache.removeAll(keepingCapacity: false)
        cached = false
    }
    func resetMaxHeight(){
        contentMaxHeight = 0
    }

}
