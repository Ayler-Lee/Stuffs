//
//  ImageViewController.swift
//  Cassina
//
//  Created by Ayler_Lee on 16/3/19.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController
{

    var imageURL: NSURL? {
        didSet {
            fetchImage()
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.bounds.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.1
            scrollView.maximumZoomScale = 2
        }
    }

    private var imageView: UIImageView = UIImageView()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var image: UIImage? {
        get { return imageView.image }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.bounds.size
        }
    }
    
    // MARK: - 视图生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addSubview(imageView)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if image == nil {
            fetchImage()
        }
    }
    
    // MARK: - 私有方法
    private func fetchImage()
    {
        if let url = imageURL {
            activityIndicator?.startAnimating()
            dispatch_async(dispatch_get_global_queue(0, 0), { () -> Void in
                
                let imageData = NSData(contentsOfURL: url)
                
                dispatch_async(dispatch_get_main_queue(), { //[weak self] in 没有造成循环引用
                    if imageData != nil {
                        self.image = UIImage(data: imageData!)
                    } else {
                        self.image = nil
                    }
                    self.activityIndicator?.stopAnimating()
                })
            })
            
        }
    }
}

// MARK: - ScrollView Delegate
extension ImageViewController: UIScrollViewDelegate
{
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
