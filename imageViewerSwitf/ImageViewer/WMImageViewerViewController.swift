//
//  WMImageViewerViewController.swift
//  imageViewerSwitf
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 wumeng. All rights reserved.
//

import UIKit


class WMImageViewerViewController: UIViewController  , UICollectionViewDelegate ,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    var colltionView : UICollectionView?
    private let reuseIdentifier = "Cell"
    
    var mainScrollView:UIScrollView?;
    var imageList:[ImageBaseModel] = []{
        didSet{
            if colltionView != nil
            {
                self.colltionView?.reloadData();
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
//        self.setUI();
        self.initColleionView();
    }
    //MARK:- 初始化父视图
    func initColleionView()
    {
        //滚动的样式
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing=0;
        //设置每一个cell的宽高
        layout.itemSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height);
        
        self.colltionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height), collectionViewLayout: layout)
        //        //注册一个cell
        colltionView! .register(WMImageCollectionViewCell.self, forCellWithReuseIdentifier:reuseIdentifier)
        colltionView?.delegate = self;
        colltionView?.dataSource = self;
        colltionView?.backgroundColor = UIColor.white
        colltionView?.isPagingEnabled = true;
        self.view.addSubview(colltionView!)
        
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageList.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:WMImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WMImageCollectionViewCell
        
        // Configure the cell
        cell.backgroundColor = UIColor.lightGray;
        //MARK:- 可以根据自己使用的第三方加载网路图片
        cell.contentScrollView?.imageView?.image = UIImage.init(named: imageList[indexPath.row].getImageUrl!()) ;
        //MARK:- 代码。。。
        return cell
    }

    
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
    
    
    
    
    
    
    
    
    
    
//    // MARK: - 视图
//    func setUI()
//    {
//        
//        self.mainScrollView = UIScrollView(frame:CGRect(x: 0.0, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height))
//        self.view.addSubview(self.mainScrollView!)
//        // 背景颜色
//        self.mainScrollView?.backgroundColor = UIColor.lightGray;
//        // 其他属性
//        self.mainScrollView?.isScrollEnabled = true // 可以上下滚动
//        self.mainScrollView?.scrollsToTop = true // 点击状态栏时，可以滚动回顶端
//        self.mainScrollView?.bounces = true // 反弹效果，即在最顶端或最底端时，仍然可以滚动，且释放后有动画返回效果
//        self.mainScrollView?.isPagingEnabled = true // 分页显示效果
//        self.mainScrollView?.showsHorizontalScrollIndicator = true // 显示水平滚动条
//        self.mainScrollView?.showsVerticalScrollIndicator = true // 显示垂直滚动条
//        self.mainScrollView?.indicatorStyle = UIScrollViewIndicatorStyle.white // 滑动条的样式
//        
//        self.setImagesData();
//        
//    }
//    //MARK:-
//    func setImagesData() -> Void {
//        // 添加子视图
//        var originX:CGFloat = 0.0
//        for number in 1...3
//        {
//            let scrollview = WMImageViewerScrollView.init(frame:  CGRect(x: originX, y: 0.0, width: (self.mainScrollView?.bounds.width)!, height:(self.mainScrollView?.bounds.height)!))
//            self.mainScrollView?.addSubview(scrollview);
//            if 1 == number
//            {
//                scrollview.backgroundColor = UIColor.brown
//            }
//            else if 2 == number
//            {
//                scrollview.backgroundColor = UIColor.blue
//            }
//            else
//            {
//                scrollview.backgroundColor = UIColor.orange
//            }
//            
//            var image = UIImage(named: "01.jpg")
//            if 2 == number
//            {
//                image = UIImage(named: "02.jpg")
//            }
//            else if 3 == number
//            {
//                image = UIImage(named: "03.jpg")
//            }
//            print("iamge== \(image)");
//            scrollview.imageView?.image = image
//            originX = (scrollview.frame.minX + scrollview.frame.width)
//            
//        }
//        // 设置内容大小
//        self.mainScrollView?.contentSize = CGSize(width: originX, height: (self.mainScrollView?.bounds.height)!);
//    }
    
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
