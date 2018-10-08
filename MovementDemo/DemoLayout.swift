//
//  DemoLayout.swift
//  MovementDemo
//
//  Created by mr.zhou on 2018/10/7.
//  Copyright © 2018 mr.zhou. All rights reserved.
//

import UIKit


class DemoLayout: UICollectionViewLayout {
    var attributes = [UICollectionViewLayoutAttributes]()
    var totalWidth = 0.0
    override var collectionViewContentSize: CGSize {
        return CGSize(width: (self.collectionView?.frame.size.width)! * 2, height: CGFloat(1000 / 9 + 1) * 50.0)
    }
    
    override func prepare() {
        if attributes.isEmpty == false {
            return
        }
        for i in 0...1000 {
            let line = i % 9
            let row = i / 9
            let attribute = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: i, section: 0))
            var width = (self.collectionView?.bounds.size.width)! / 5.0
            let height = CGFloat(50)
            let y = CGFloat(row) * height
            
            if (line == 0) {
                attribute.alpha = 0.5
                attribute.frame = CGRect(x: 0, y: y, width: width * 2.0, height: height)

            } else {
                width = (self.collectionView?.bounds.size.width)! / 5.0
                attribute.frame = CGRect(x: CGFloat(line + 1) * width, y: y, width: width, height: height)
            }
            attributes.append(attribute)
        }

    }
    
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//
//        return attributes[indexPath.item] as! UICollectionViewLayoutAttributes
//    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var arr = [UICollectionViewLayoutAttributes]()
        for layout in attributes {
            if rect.intersects(layout.frame) && !arr.contains(layout) {
                arr.append(layout)
            }
        }

        
        return arr
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }


}
