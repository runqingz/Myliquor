//
//  Liquor.swift
//  MyLiquor
//
//  Created by ZhangRunqing on 16/8/12.
//  Copyright © 2016年 ZhangRunqing. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Liquor: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    func setLiquorImage(img: UIImage){
        let data = UIImagePNGRepresentation(img)
        self.image = data
    }
    
    
    func getImage() -> UIImage? {
        let data = self.image
        let img = UIImage(data: data!)
        return img
    }
    
    
}
