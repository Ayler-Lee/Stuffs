//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Ayler_Lee on 16/3/19.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import UIKit

private struct History {
    static let SegueIdentifier = "showHistory"
    static let DefaultsKey = "DiagnosticHistoryUserDefaultsKey"
}

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverControllerDelegate {
    
    private let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var diagnosticHistory: [Int] {
        set { userDefaults.setObject(newValue, forKey: History.DefaultsKey) }
        get { return userDefaults.objectForKey(History.DefaultsKey) as? [Int] ?? []}
    }
    
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let tvc = segue.destinationViewController as? HistoryViewController {
//                    if let ppc = tvc.popoverPresentationController {
//                        ppc.delegate = self 
/*UIPopoverController is deprecated. Popovers are now implemented as UIViewController presentations. Use a modal presentation style of UIModalPresentationPopover and UIPopoverPresentationController */
//                    }
                    tvc.text = "\(diagnosticHistory)"
                }
            default: break
            }
        }
    }
    
}
