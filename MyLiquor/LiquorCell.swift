//
//  LiquorCell.swift
//  MyLiquor
//
//  Created by ZhangRunqing on 16/8/13.
//  Copyright © 2016年 ZhangRunqing. All rights reserved.
//

import UIKit

class LiquorCell: UITableViewCell {
    
    @IBOutlet weak var liquorImg: UIImageView!
    @IBOutlet weak var liquorTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        liquorImg.layer.cornerRadius = 4.0
        liquorImg.clipsToBounds =  true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell (liquor: Liquor){
        liquorImg.image = liquor.getImage()
        liquorTitle.text = liquor.title
    }
    
    
}
