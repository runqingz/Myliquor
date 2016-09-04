//
//  MainVC.swift
//  MyLiquor
//
//  Created by ZhangRunqing on 16/8/13.
//  Copyright © 2016年 ZhangRunqing. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var googleBtn: UIButton!
    
    var liquors =  [Liquor]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        googleBtn.layer.cornerRadius = 5.0
    }
    
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResult()
        tableView.reloadData()
    }
    
   
    
    func fetchAndSetResult(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchrequest = NSFetchRequest(entityName: "Liquor")
        do{
            let results = try context.executeFetchRequest(fetchrequest)
            self.liquors = results as! [Liquor]
        }catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return liquors.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("LiquorCell") as? LiquorCell{
            let liquor = liquors[indexPath.row]
            cell.configureCell(liquor)
            return cell
            
        }else{
            return LiquorCell()
            
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let liquor = liquors[indexPath.row]
        performSegueWithIdentifier("ShowDetail", sender: liquor)
        
    }
    
   
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail"{
            if let detailVC = segue.destinationViewController as? DetailVC {
                if let liquor = sender as? Liquor{
                    
                   detailVC.liquor = liquor
                }
            }
            
        }
    }
    
    
    
    
    
    
    
}
