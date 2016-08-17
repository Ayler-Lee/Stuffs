//
//  AppDelegate.swift
//  Trax
//
//  Created by Ayler_Lee on 16/3/26.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import UIKit

struct GPXURL {
    static let Notification = "GPX Radio Station"
    static let key = "GPX URL Key"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

//    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
//        
//        let center = NSNotificationCenter.defaultCenter()
//        let notifacation = NSNotification(name: GPXURL.Notification, object: self, userInfo: [GPXURL.key: url])
//        center.postNotification(notifacation)
//        
//        return true
//    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        let center = NSNotificationCenter.defaultCenter()
        let notifacation = NSNotification(name: GPXURL.Notification, object: self, userInfo: [GPXURL.key: "hello"])
        center.postNotification(notifacation)
        print("异步")

    }
}

