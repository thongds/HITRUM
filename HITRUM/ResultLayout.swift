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
        return CGSize(width: width, height: max((collectionView?.frame.height)!,contentMaxHeight))
    }
    
    var yOffset: CGFloat = 0
    override func prepare() {
        print("prepare")
        if cache.count == 0{
            let contentWidth = width
            //yOffset = space
            let itemHeight : CGFloat = 100
            for _ in 0..<collectionView!.numberOfItems(inSection: 0){
                contentMaxHeight += itemHeight + space
            }
            
            yOffset =  max((collectionView?.frame.height)!,contentMaxHeight) - itemHeight - space
            
            for item in 0..<collectionView!.numberOfItems(inSection: 0){
                let indexPath = IndexPath(item: item, section: 0)
                let frame = CGRect(x: 0, y: yOffset, width: contentWidth, height: itemHeight)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.frame = frame
                cache.append(attributes)
                yOffset = yOffset - itemHeight - space
                cached = true
            }
            collectionView?.contentOffset = CGPoint(x: 0, y: max((collectionView?.frame.height)!,contentMaxHeight))
            
        }
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            //layoutAttributes.append(attributes)
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        print("cache size\(cache.count)")
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
