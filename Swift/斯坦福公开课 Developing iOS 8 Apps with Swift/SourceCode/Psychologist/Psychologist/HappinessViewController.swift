//
//  ViewController.swift
//  Happiness
//
//  Created by Ayler_Lee on 16/3/17.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
            faceView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "changeHappiness:"))
        }
    }
    
    var happiness: Int = 70 {
        didSet {
            happiness = min(max(0, happiness), 100)
            print(happiness)
            updateUI()
        }
    }
    
    private func updateUI() {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }
}

// MARK: - 手势识别
extension HappinessViewController
{
    func changeHappiness(gesture: UIPanGestureRecognizer) {
        if gesture.state == .Changed {
            let translation = gesture.translationInView(faceView)
            let happinessChange = Int(translation.y / 4)
            if happiness != 0 {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        }
    }
}

