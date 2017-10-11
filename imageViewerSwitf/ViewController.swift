//
//  ViewController.swift
//  imageViewerSwitf
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 wumeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func imageClick(_ sender: Any) {
       
        let vc = WMImageViewerViewController();
        
        var list:[ImageListModel] = [];
        for  i in 1...3
        {
            let url = "0\(i).jpg";
            let model = ImageListModel.init();
            model.url = url;
            list.append(model);
        }
        vc.imageList = list;
        print("\(list)")
        self.navigationController?.pushViewController(vc, animated: true);
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

