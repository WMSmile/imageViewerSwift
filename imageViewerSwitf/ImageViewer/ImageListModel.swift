//
//  ImageListModel.swift
//  imageViewerSwitf
//
//  Created by apple on 2017/10/10.
//  Copyright © 2017年 wumeng. All rights reserved.
//

import UIKit

protocol ImageBaseModelProtocol {
    func getImageUrl() -> String //图片地址

}
extension ImageBaseModelProtocol{
    func getImageUrl() -> String {return ""}
}


//MARK:- 你可以自定义model，遵循ImageModel的协议 用其他model也是一样
class ImageListModel: NSObject ,ImageBaseModelProtocol{
    
    var url:String?
    
    func getImageUrl() -> String {
        return url ?? "";
    }

}
