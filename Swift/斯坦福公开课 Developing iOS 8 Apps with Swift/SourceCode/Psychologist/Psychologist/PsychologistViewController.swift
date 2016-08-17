//
//  ViewController.swift
//  Psychologist
//
//  Created by Ayler_Lee on 16/3/19.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 本地数据地址
        print(NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true))
    }
    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        var destination = segue.destinationViewController
        
        if let nav = destination as? UINavigationController {
            destination = nav.visibleViewController!
        }
        
        if let happyVC = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                
                switch identifier {
                    case "happy": happyVC.happiness = 100
                    case "sad": happyVC.happiness = 0
                    case "nothing": happyVC.happiness = 25
                default: happyVC.happiness = 50
                }
            }
        }
    }

}

