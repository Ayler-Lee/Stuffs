//
//  BezierPathView.swift
//  Dropit
//
//  Created by Ayler_Lee on 16/3/21.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import UIKit

class BezierPathView: UIView {
    
    var bezierPath = [String: UIBezierPath]()
    
    func setPath(name: String, path: UIBezierPath?) {
        bezierPath[name] = path
        setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        for (_, path) in bezierPath {
            path.stroke()
        }
    }

}
