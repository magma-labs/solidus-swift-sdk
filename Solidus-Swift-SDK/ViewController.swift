//
//  ViewController.swift
//  Solidus-Swift-SDK
//
//  Created by Omar Guzman on 5/2/16.
//  Copyright © 2016 Omar Guzman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //testing countries...
        /*
        Countries.List { (result) in
            print("Result:\(result)")
        }
        
        Countries.ListStates("1") { (result) in
            print("states for 1 result \(result)")
        }
 
        Countries.Show("157") { (result) in
            print("country 157 result \(result)")
        }
        Countries.ShowState("157", StateId: "2249") { (result) in
            print("states 157 for 2249 result \(result)")
        }
         */
        
        Countries.Search("Mexico") { (result) in
            print("Search Result:\(result)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

