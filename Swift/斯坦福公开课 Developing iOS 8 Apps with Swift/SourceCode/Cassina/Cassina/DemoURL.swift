//
//  DemoURL.swift
//  Cassina
//
//  Created by Ayler_Lee on 16/3/19.
//  Copyright © 2016年 Ayler. All rights reserved.
//

import Foundation

struct DemoURL {
    // http://comm.stanford.edu/wp-content/uploads/2013/01/stanford-campus.png
    // http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg
    // http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg
    // http://www.nasa.gov/sites/default/files/saturn_collage.jpg

    static let Stanford = NSURL(string: "http://img1.imgtn.bdimg.com/it/u=174332768,2556381065&fm=21&gp=0.jpg")
    struct NASA {
        static let Cassini = NSURL(string: "http://www.astron.ac.cn/upload_files/article/22/31769_20100303090329_nsvzz.jpg")
        static let Earth = NSURL(string: "http://img.taopic.com/uploads/allimg/121226/234737-12122616030125.jpg")
        static let Saturn = NSURL(string: "http://c.hiphotos.baidu.com/zhidao/pic/item/342ac65c1038534301f9d40e9113b07eca8088ef.jpg")
    }
}