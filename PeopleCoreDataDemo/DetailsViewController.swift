//
//  ViewController.swift
//  PeopleCoreDataDemo
//
//  Created by HackerU on 26/05/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    
    var data:Person?
    
    var delegate:AppDelegate!
    var context:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          delegate = UIApplication.sharedApplication().delegate as! AppDelegate
          context = delegate.managedObjectContext
        
          firstName?.text = data?.firstName
          lastName?.text = data?.lastName
    }
    
    override func willMoveToParentViewController(parent: UIViewController?) {
        if parent == nil{
            print("Quiting the Details View Controller")
        }
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        print("View Will disapear")
        
        data?.firstName = firstName.text ?? "<Not Set>"
        data?.lastName = firstName.text ?? "<Not Set>"
        do{ try context.save() }
        catch let e as NSError{print(e)}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

