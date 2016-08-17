//
//  ViewController.swift
//  Trax
//
//  Created by Ayler_Lee on 16/3/26.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate
{
//    @IBOutlet weak var mapView: MKMapView! {
//        didSet {
//            mapView.mapType = .Satellite
//            mapView.delegate = self
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let center = NSNotificationCenter.defaultCenter()
        let queue = NSOperationQueue.mainQueue()
        let obj = AppDelegate()
        print("viewDidLoad")
        center.addObserverForName(GPXURL.Notification, object: nil, queue: nil) { (notification) -> Void in
//            print(notification.userInfo)
            print("同步,收到")
        }
    }

}

