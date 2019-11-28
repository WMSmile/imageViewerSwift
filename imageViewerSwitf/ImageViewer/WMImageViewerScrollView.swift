//
//  WMImageViewerScrollView.swift
//  imageViewerSwitf
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 wumeng. All rights reserved.
//

import UIKit

class WMImageViewerScrollView: UIScrollView ,UIScrollViewDelegate{
    var imageView:UIImageView?;
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        initViews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- 初始化
    func initViews() -> Void {
        // 两个手指拿捏缩放
        self.minimumZoomScale = 0.3
        self.maximumZoomScale = 2.0
        self.delegate = self
        
        self.imageView = UIImageView(frame: self.bounds)
        self.addSubview(imageView!);
        imageView?.contentMode = .scaleAspectFit
        imageView?.backgroundColor = UIColor.clear;
        
        // 双击缩放
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleClick(gestureRecognizer:)));
        doubleTap.numberOfTapsRequired = 2
        imageView?.isUserInteractionEnabled = true
        imageView?.addGestureRecognizer(doubleTap)
        
    }
    // MARK: - UIScrollViewDelegate
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        print("scrollViewDidZoom")
        // 设置被缩放的对应视图
        for imageview in scrollView.subviews
        {
            if imageview is UIImageView
            {
                return imageview
            }
        }
        return nil
    }
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?)
    {
//        print("scrollViewWillBeginZooming")
//        

    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView)
    {

        // 居中显示
        let imageview = scrollView.subviews.first as! UIImageView
        self.centerShow(scrollview: scrollView, imageview: imageview)
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat)
    {

        // 缩放效果
        // 放大或缩小
        if scrollView.minimumZoomScale >= scale
        {
            scrollView.setZoomScale(0.3, animated: true)
        }
        if scrollView.maximumZoomScale <= scale
        {
            scrollView.setZoomScale(2.0, animated: true)
        }
    }
    
    
    // MARK: - 双击缩放
    var isScaleBig:Bool = false
    @objc func doubleClick(gestureRecognizer:UITapGestureRecognizer)
    {
        let imageview = gestureRecognizer.view as! UIImageView
        let scrollview = imageview.superview as! UIScrollView
        
        // 放大缩小
        let scale = scrollview.zoomScale
        if isScaleBig
        {
            scrollview.setZoomScale((scale / 0.3), animated: true)
            isScaleBig = false
        }
        else
        {
            scrollview.setZoomScale((scale * 0.3), animated: true)
            isScaleBig = true
        }
    }
    //MARK:-  居中显示
    func centerShow(scrollview:UIScrollView, imageview:UIImageView)
    {
        // 居中显示
        let offsetX = (scrollview.bounds.size.width > scrollview.contentSize.width) ? (scrollview.bounds.size.width - scrollview.contentSize.width) * 0.5 : 0.0;
        let offsetY = (scrollview.bounds.size.height > scrollview.contentSize.height) ?
            (scrollview.bounds.size.height - scrollview.contentSize.height) * 0.5 : 0.0;
        imageview.center =  CGPoint(x: scrollview.contentSize.width * 0.5 + offsetX, y: scrollview.contentSize.height * 0.5 + offsetY);
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
