//
//  ViewController.swift
//  MXFooterView
//
//  Created by 李茂轩 on 15/12/9.
//  Copyright © 2015年 Max. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var myTableView: UITableView!
    var nameArrays :[String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initData()
        registerXIB()
        settingTabView()
        addMXFooterView()
    }
    
    func addMXFooterView(){
    
    myTableView.mx_addFooterLoadMoreView()
    
    
    }
    
    
    // MARK: -  scrollView
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        
        
        if  scrollView.frame.size.height + scrollView.contentOffset.y > scrollView.contentSize.height{
            
            
            myTableView.mx_startAnimation("load more", actionHandler: { () -> Void in
                
                self.nameArrays.append("append data")

                self.performSelector("finish", withObject: nil, afterDelay: 1)
//                self.requestLinkMan()
            })
            
            
        }
        
    }
    
    func finish(){
    
        self.myTableView.reloadData()
        self.myTableView.mx_stopAnimation("")
        
        if nameArrays.count == 33 {
        myTableView.mx_finished()
        
        }
    
    
    }
    
    func settingTabView(){
    
        
        myTableView.dataSource = self
        myTableView.delegate = self
    
    
    
    }
    
    func initData(){
    
    
    nameArrays = [String]()
        
        for var i = 0 ; i < 30 ; i++ {
            nameArrays.append("data")
        }
    }
    
    func registerXIB(){
    
    
    myTableView.registerNib(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
    
    
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
     {
    
    return nameArrays.count
    
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
        let cell = tableView.dequeueReusableCellWithIdentifier("MyTableViewCell", forIndexPath: indexPath) as! MyTableViewCell

        
        cell.myLabel.text = nameArrays[indexPath.row]
    
        
        return cell
    
    
    }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

