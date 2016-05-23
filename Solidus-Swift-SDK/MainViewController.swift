//
//  MainViewController.swift
//  Solidus-Swift-SDK
//
//  Created by Omar Guzman on 5/3/16.
//  Copyright © 2016 Omar Guzman. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblOrders: UITableView?
    var arrOrders = []
    let cellId = "orderCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tblOrders?.dataSource = self
        tblOrders?.delegate = self
        tblOrders?.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellId)
        self.loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func loadData() {
        Orders.list { (success, result, error) in
            self.arrOrders = result.objectForKey("orders") as! NSArray
            self.tblOrders?.reloadData()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrOrders.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dictItem = arrOrders[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
        cell.textLabel?.text = dictItem.objectForKey("number") as? String
        
        return cell
    }
}
