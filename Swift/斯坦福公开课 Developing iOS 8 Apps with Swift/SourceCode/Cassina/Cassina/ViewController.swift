//
//  ViewController.swift
//  Cassina
//
//  Created by Ayler_Lee on 16/3/19.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let imagevc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "showEarth":
                    imagevc.imageURL = DemoURL.NASA.Earth
                    imagevc.title = "Earth"
                case "showSaturn":
                    imagevc.imageURL = DemoURL.NASA.Saturn
                    imagevc.title = "Saturn"
                case "showCassini":
                    imagevc.imageURL = DemoURL.NASA.Cassini
                    imagevc.title = "Cassini"
                    
                default:break
                }
            }
        }
    }

}

