//
//  ViewController.swift
//  PeopleCoreDataDemo
//
//  Created by HackerU on 26/05/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var delegate:AppDelegate!
    var context:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          delegate = UIApplication.sharedApplication().delegate as! AppDelegate
          context = delegate.managedObjectContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

