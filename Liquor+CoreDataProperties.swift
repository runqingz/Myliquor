//
//  Liquor+CoreDataProperties.swift
//  MyLiquor
//
//  Created by ZhangRunqing on 16/8/12.
//  Copyright © 2016年 ZhangRunqing. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Liquor {

    @NSManaged var title: String?
    @NSManaged var image: NSData?
    @NSManaged var ingradients: String?
    @NSManaged var descript: String?

}
