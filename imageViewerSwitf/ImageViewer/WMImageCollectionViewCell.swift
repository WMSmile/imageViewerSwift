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
    
    var saveCallback:((_ object:Any?) -> Void)? = nil
    
    
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
        
        //长按保存图片
        let longPress:UILongPressGestureRecognizer  = UILongPressGestureRecognizer.init(target: self, action: #selector(longPress(_:)));
        self.addGestureRecognizer(longPress);

    }
    // longPress
    @objc func longPress(_ sender:UILongPressGestureRecognizer) -> Void {
        
        
        if self.saveCallback != nil{
            self.saveCallback!(self.contentScrollView?.imageView?.image ?? nil);
        }
        
        
        
    }


}
