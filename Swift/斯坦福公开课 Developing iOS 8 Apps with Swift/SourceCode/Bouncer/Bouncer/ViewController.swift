//
//  ViewController.swift
//  Bouncer
//
//  Created by Ayler_Lee on 16/3/24.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var boucer: BouncerBehavior = BouncerBehavior()
    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.view)
    }()
    
    lazy var redBlock: UIView = {
        let block = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: 40, height: 40)))
        block.backgroundColor = UIColor.redColor()
        block.center = self.view.center
        return block
    }()
    
    // MARK: - 视图生命周期
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(redBlock)
        animator.addBehavior(boucer)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        boucer.addBlock(redBlock)
        let motionManager = AppDelegate.Motion.manager
        if motionManager.accelerometerAvailable {
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data, error) in
                if data != nil {
                    self.boucer.gravity.gravityDirection = CGVector(dx: data!.acceleration.x, dy: data!.acceleration.y)
                }
            })
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        AppDelegate.Motion.manager.stopAccelerometerUpdates()
    }
    
    deinit {
        print("88")
    }
}

