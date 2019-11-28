//
//  UIColor+Extension(wm).swift
//  imageViewerSwitf
//
//  Created by wumeng on 2019/11/28.
//  Copyright © 2019 wumeng. All rights reserved.
//

import UIKit

extension UIColor {
    /**
     *  随机颜色
     */
    class var randomColor: UIColor {
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}

