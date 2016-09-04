//
//  webVC.swift
//  MyLiquor
//
//  Created by ZhangRunqing on 16/8/31.
//  Copyright © 2016年 ZhangRunqing. All rights reserved.
//

import UIKit
import WebKit


class webVC: UIViewController {
    
    
    @IBOutlet weak var container: UIView!
    var webView :WKWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        container.addSubview(webView)
    }
    
    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
        
        loadRequest("https://www.google.ca/#q=gin+cocktail")
    
    }
    
    func loadRequest(urlStr: String){
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
    
    @IBAction func loadGin(sender: AnyObject){
        loadRequest("https://www.google.ca/#q=gin+cocktail")

    }
    
    @IBAction func loadWhisky(sender: AnyObject){
        loadRequest("https://www.google.ca/#q=whisky+cocktail")
        
    }
    
    @IBAction func loadVodka(sender: AnyObject){
        loadRequest("https://www.google.ca/#q=vodka+cocktail")
        
    }
    
    @IBAction func loadRum(sender: AnyObject){
        loadRequest("https://www.google.ca/#q=rum+cocktail")
        
    }
   
}
