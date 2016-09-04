//
//  DetailVC.swift
//  MyLiquor
//
//  Created by ZhangRunqing on 16/8/13.
//  Copyright © 2016年 ZhangRunqing. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var liquorTitle: UILabel!
    @IBOutlet weak var liquorDescription: UILabel!
    @IBOutlet weak var liquorIngradiants: UILabel!
    @IBOutlet weak var liquorImage: UIImageView!
    
    var liquor: Liquor?
    
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        liquorImage.layer.cornerRadius = 5.0
        liquorImage.clipsToBounds = true
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        if let detailedLiquor = liquor {
            liquorTitle.text = detailedLiquor.title
            liquorIngradiants.text = detailedLiquor.ingradients
            liquorDescription.text = detailedLiquor.descript
            liquorImage.image = detailedLiquor.getImage()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    

  
}
