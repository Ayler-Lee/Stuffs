//
//  BouncerBehavior.swift
//  Bouncer
//
//  Created by Ayler_Lee on 16/3/24.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import UIKit

class BouncerBehavior: UIDynamicBehavior {
    
    let gravity = UIGravityBehavior()
    
    lazy var collision: UICollisionBehavior = {
        let lazyCollision = UICollisionBehavior()
        lazyCollision.translatesReferenceBoundsIntoBoundary = true
        return lazyCollision
    }()
    
    lazy var itemBehavior: UIDynamicItemBehavior = {
        let lazyItemBehavior = UIDynamicItemBehavior()
        //        lazyItemBehavior.allowsRotation = false
        lazyItemBehavior.elasticity = 0.5 // 弹性
        lazyItemBehavior.friction = 0 // 摩擦力
        lazyItemBehavior.resistance = 0 // 速度阻尼
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
    
    func addBlock(block: UIView) {
        dynamicAnimator?.referenceView?.addSubview(block)
        gravity.addItem(block)
        collision.addItem(block)
        itemBehavior.addItem(block)
    }
    
    func removeBlock(block: UIView) {
        gravity.removeItem(block)
        collision.removeItem(block)
        itemBehavior.removeItem(block)
        block.removeFromSuperview()
    }
    
}
