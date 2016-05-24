//
//  HistoryViewController.swift
//  Psychologist
//
//  Created by Ayler_Lee on 16/3/19.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = text
        }
    }
    
    var text: String = "" {
        didSet {
//            textView.text = text // 不需要
        }
    }
    
    override var preferredContentSize: CGSize {
        get {
            if textView != nil && presentingViewController != nil {
                return textView.sizeThatFits(presentingViewController!.view.bounds.size)
            } else {
                return super.preferredContentSize
            }
        }
        set {
            super.preferredContentSize = newValue
        }
    }
}
