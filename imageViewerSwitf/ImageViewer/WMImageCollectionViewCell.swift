//
//  WMImageCollectionViewCell.swift
//  imageViewerSwitf
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 wumeng. All rights reserved.
//

import UIKit

class WMImageCollectionViewCell: UICollectionViewCell {
    
    var contentScrollView:WMImageViewerScrollView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        initViews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:-
    func initViews() -> Void {
        
        self.contentScrollView = WMImageViewerScrollView.init(frame: self.bounds);
        self.contentScrollView?.backgroundColor = UIColor.clear;
        self.contentView.addSubview(contentScrollView!);

    }
    


}

//extension UIColor {
//    /**
//     *  随机颜色
//     */
//    class var randomColor: UIColor {
//        get {
//            let red = CGFloat(arc4random()%256)/255.0
//            let green = CGFloat(arc4random()%256)/255.0
//            let blue = CGFloat(arc4random()%256)/255.0
//            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
//        }
//}
//}
