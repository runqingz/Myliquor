//
//  NewVC.swift
//  MyLiquor
//
//  Created by ZhangRunqing on 16/8/13.
//  Copyright © 2016年 ZhangRunqing. All rights reserved.
//

import UIKit
import CoreData

class NewVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var liquorTitle: UITextField!
    @IBOutlet weak var ingrad: UITextField!
    @IBOutlet weak var volume: UITextField!
    @IBOutlet weak var liqourDescription: UITextField!
    @IBOutlet weak var liquorImage: UIImageView!
    @IBOutlet weak var ingradLabel: UILabel!
    @IBOutlet weak var addImageBtn: UIButton!
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        liquorImage.layer.cornerRadius = 5.0
        liquorImage.clipsToBounds = true

    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        liquorImage.image = image
    }
  
    @IBAction func addImage(sender: AnyObject){
        presentViewController(imagePicker, animated: true, completion: nil)
        addImageBtn.setTitle("Change one?", forState: .Normal)
        
    }
    
    @IBAction func createNewLiquor(sender: AnyObject){
        
        if let title = liquorTitle.text where title != ""{
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Liquor", inManagedObjectContext: context)!
            let liquor = Liquor(entity: entity, insertIntoManagedObjectContext: context)
            liquor.title = title
            liquor.ingradients = ingradLabel.text
            liquor.descript = liqourDescription.text
            liquor.setLiquorImage(liquorImage.image!)
            context.insertObject(liquor)
        
            
            do{
                try context.save()
                
            }catch{
                print("Can not save the liquor")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
        }
        
    }
    
    @IBAction func addAnIngradiants(sender: AnyObject){
        if let ingradiant = ingrad.text, let vol = volume.text{
            if ingradLabel.text == "" {
                ingradLabel.text?.appendContentsOf("\(ingradiant): \(vol) Oz")
            }else{
                ingradLabel.text?.appendContentsOf(", \(ingradiant): \(vol) Oz")
            }
            ingrad.text = ""
            volume.text = ""
        }
    }
    
    
    @IBAction func clearAllIngradiants(sender: AnyObject){
        ingradLabel.text = ""
    }
    
}
