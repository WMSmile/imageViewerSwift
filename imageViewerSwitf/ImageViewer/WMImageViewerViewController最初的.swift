//
//  WMImageViewerViewController.swift
//  imageViewerSwitf
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 wumeng. All rights reserved.
//

import UIKit

class WMImageViewerViewController: UIViewController ,UIScrollViewDelegate{
    
    var mainScrollView:UIScrollView?;
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setUI();
    }
    
    
    
    // MARK: - 视图
    
    func setUI()
    {
        
        self.mainScrollView = UIScrollView(frame:CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height))
        self.view.addSubview(self.mainScrollView!)
        // 背景颜色
        self.mainScrollView?.backgroundColor = UIColor.lightGray;
        // 其他属性
        self.mainScrollView?.isScrollEnabled = true // 可以上下滚动
        self.mainScrollView?.scrollsToTop = true // 点击状态栏时，可以滚动回顶端
        self.mainScrollView?.bounces = true // 反弹效果，即在最顶端或最底端时，仍然可以滚动，且释放后有动画返回效果
        self.mainScrollView?.isPagingEnabled = true // 分页显示效果
        self.mainScrollView?.showsHorizontalScrollIndicator = true // 显示水平滚动条
        self.mainScrollView?.showsVerticalScrollIndicator = true // 显示垂直滚动条
        self.mainScrollView?.indicatorStyle = UIScrollViewIndicatorStyle.white // 滑动条的样式

        // 添加子视图label
        var originX:CGFloat = 0.0
        for number in 1...3
        {
            let scrollview = UIScrollView(frame:  CGRect(x: originX, y: 0.0, width: (self.mainScrollView?.bounds.width)!, height:(self.mainScrollView?.bounds.height)!))
            self.mainScrollView?.addSubview(scrollview);
            if 1 == number
            {
                scrollview.backgroundColor = UIColor.brown
            }
            else if 2 == number
            {
                scrollview.backgroundColor = UIColor.blue
            }
            else
            {
                scrollview.backgroundColor = UIColor.orange
            }
            
            let imageview = UIImageView(frame: scrollview.bounds)
            scrollview.addSubview(imageview);
            imageview.contentMode = .scaleAspectFit
            imageview.backgroundColor = UIColor.purple
            var image = UIImage(named: "01.jpg")
            if 2 == number
            {
                image = UIImage(named: "02.jpg")
            }
            else if 3 == number
            {
                image = UIImage(named: "03.jpg")
            }
            print("iamge== \(image)");
            imageview.image = image
            
            
            originX = (scrollview.frame.minX + scrollview.frame.width)
            
            
            // 两个手指拿捏缩放
            scrollview.minimumZoomScale = 0.3
            scrollview.maximumZoomScale = 2.0
            scrollview.delegate = self
            
            // 双击缩放
            let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleClick(gestureRecognizer:)));
            doubleTap.numberOfTapsRequired = 2
            imageview.isUserInteractionEnabled = true
            imageview.addGestureRecognizer(doubleTap)
        }
        
        // 设置内容大小
        self.mainScrollView?.contentSize = CGSize(width: originX, height: (self.mainScrollView?.bounds.height)!);
    }
    
    
    // MARK: - UIScrollViewDelegate
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        print("1 scrollViewDidZoom")
        
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
        print("2 scrollViewWillBeginZooming")
        
        print("view = \(view)")
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView)
    {
        print("3 scrollViewDidZoom")
        
        // 居中显示
        let imageview = scrollView.subviews.first as! UIImageView
        self.centerShow(scrollview: scrollView, imageview: imageview)
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat)
    {
        print("4 scrollViewDidEndZooming")
        
        print("scale = \(scale)，view = \(view)")
        
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
    func doubleClick(gestureRecognizer:UITapGestureRecognizer)
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
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
