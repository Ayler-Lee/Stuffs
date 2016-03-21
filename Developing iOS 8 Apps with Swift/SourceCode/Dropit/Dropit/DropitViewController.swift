//
//  DropitViewController.swift
//  Dropit
//
//  Created by Ayler_Lee on 16/3/20.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import UIKit

class DropitViewController: UIViewController, UIDynamicAnimatorDelegate {
    @IBOutlet weak var gameView: BezierPathView!
    
    lazy var animator: UIDynamicAnimator = {
        let lazyAnimator = UIDynamicAnimator(referenceView: self.gameView)
        lazyAnimator.delegate = self
    return lazyAnimator
    }()
    
    let dropBehavior: DropitBehavior = DropitBehavior()
    
    var attachBehavior: UIAttachmentBehavior? {
        willSet {
            if let attach = attachBehavior {
                animator.removeBehavior(attach)
                gameView.setPath(PathName.Attachment, path: nil)
            }
        }
        didSet {
            if attachBehavior != nil {
                animator.addBehavior(attachBehavior!)
                attachBehavior?.action = { [unowned self] in
                    if let attachedView = self.attachBehavior?.items.first as? UIView {
                        let path = UIBezierPath()
                        path.moveToPoint(self.attachBehavior!.anchorPoint)
                        path.addLineToPoint(attachedView.center)
                        self.gameView.setPath(PathName.Attachment, path: path)
                    }
                }
            }
        }
    }

    var dropPerRow: Int = 10
    
    var dropSize: CGSize {
        let side = gameView.bounds.width / CGFloat(dropPerRow)
        return CGSize(width: side, height: side)
    }
    
    // MARK: - 视图生命周期
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        animator.addBehavior(dropBehavior)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        let barrierSize = dropSize
//        let barrierOrigin = CGPoint(x: gameView.bounds.midX-barrierSize.width/2, y: gameView.bounds.midY-barrierSize.height/2)
        
//        let path = UIBezierPath(ovalInRect: CGRect(origin: barrierOrigin, size: barrierSize))
        let path = UIBezierPath()
//        dropBehavior.addBarrier(path, name: PathName.MiddleBarrier)
        gameView.setPath(PathName.MiddleBarrier, path: path)
    }
    
    struct PathName {
        static let MiddleBarrier = "MiddleBarrier"
        static let Attachment = "Attachment"
    }
    /**
     点击屏幕掉落方块
     */
    @IBAction func dropGesture(sender: UITapGestureRecognizer)
    {
        drop()
    }
    
    @IBAction func grabDrop(sender: UIPanGestureRecognizer) {
        let gesturePoint = sender.locationInView(gameView)
        
        switch sender.state {
        case .Began:
            if let viewToAttach = lastDropView {
                attachBehavior = UIAttachmentBehavior(item: viewToAttach, attachedToAnchor: gesturePoint)
                lastDropView = nil
            }
        case .Changed:
            attachBehavior?.anchorPoint = gesturePoint
        case .Ended:
            attachBehavior = nil
        default: break
        }
    }
    
    /**
     动画暂停时 消除整行
     */
    func dynamicAnimatorDidPause(animator: UIDynamicAnimator) {
        removeCompletedRow()
    }
    var lastDropView: UIView?
    // MARK: - 私有方法
    private func drop()
    {
        var frame = CGRect(origin: CGPointZero, size: dropSize)
        frame.origin.x = CGFloat(random() % dropPerRow) * dropSize.width
        
        let dropView = UIView(frame: frame)
        dropView.backgroundColor = UIColor.randomColor()
        dropBehavior.addDrop(dropView)
        lastDropView = dropView
    }
    
    private func removeCompletedRow()
    {
        var dropsToRemove = [UIView]()
        var dropFrame = CGRect(x: 0, y: gameView.frame.maxY, width: dropSize.width, height: dropSize.width)
        
        repeat {
            dropFrame.origin.y -= dropSize.height
            dropFrame.origin.x = 0
            var dropFound = [UIView]()
            var rowIsCompleted = true
            
            for _ in 0 ..< dropPerRow {
                if let hitView = gameView.hitTest(CGPoint(x: dropFrame.midX, y: dropFrame.midY), withEvent: nil) {
                    if hitView.superview == gameView {
                        dropFound.append(hitView)
                    } else {
                        rowIsCompleted = false
                    }
                }
                dropFrame.origin.x += dropSize.width
            }
            if rowIsCompleted {
                dropsToRemove += dropFound
            }
        } while dropsToRemove.count == 0 && dropFrame.origin.y > 0
        
        for drop in dropsToRemove {
            dropBehavior.removeDrop(drop)
        }
        
    }
}

// MARK: - UIColor 扩展
extension UIColor {
    /**
     随机色
     */
    class func randomColor() -> UIColor {
        // 0~255
        let r = CGFloat(random() % 256) / 255.0
        let g = CGFloat(random() % 256) / 255.0
        let b = CGFloat(random() % 256) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}
