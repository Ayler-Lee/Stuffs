//
//  DropitBehavior.swift
//  Dropit
//
//  Created by Ayler_Lee on 16/3/20.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import UIKit

class DropitBehavior: UIDynamicBehavior {
    
    let gravity = UIGravityBehavior()
    
    lazy var collision: UICollisionBehavior = {
        let lazyCollision = UICollisionBehavior()
        lazyCollision.translatesReferenceBoundsIntoBoundary = true
        return lazyCollision
    }()
    
    lazy var itemBehavior: UIDynamicItemBehavior = {
        let lazyItemBehavior = UIDynamicItemBehavior()
//        lazyItemBehavior.allowsRotation = false
        lazyItemBehavior.elasticity = 0.5
        return lazyItemBehavior
    }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collision)
        addChildBehavior(itemBehavior)
    }
    
    func addBarrier(path: UIBezierPath, name: String) {
        collision.removeAllBoundaries()
        collision.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addDrop(drop: UIView) {
        dynamicAnimator?.referenceView?.addSubview(drop)
        gravity.addItem(drop)
        collision.addItem(drop)
        itemBehavior.addItem(drop)
    }
    
    func removeDrop(drop: UIView) {
        gravity.removeItem(drop)
        collision.removeItem(drop)
        itemBehavior.removeItem(drop)
        drop.removeFromSuperview()
    }

}
