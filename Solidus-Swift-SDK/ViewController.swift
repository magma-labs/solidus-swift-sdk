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
        
        Countries.List { (result) in
            print("Result:\(result)")
        }
        
        Countries.Show("10") { (result) in
            print("country 10 result \(result)")
        }
        
        Countries.ListStates("1") { (result) in
            print("states for 1 result \(result)")
        }
 
        Countries.ShowState("1", StateId: "1") { (result) in
            print("states 1 for 1 result \(result)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

