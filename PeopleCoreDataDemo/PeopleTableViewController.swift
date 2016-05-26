//
//  PeopleTableViewController.swift
//  PeopleCoreDataDemo
//
//  Created by HackerU on 26/05/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit


class PeopleTableViewController: UITableViewController {

    let dataSource = PeopleDataSource()
    
    @IBAction func addPerson(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .Alert)
        
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "First Name..."
        }
        
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Last Name..."
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) -> Void in
            print("Cancled")
        }))
        
        
        alert.addAction(UIAlertAction(title: "Save", style: .Default, handler: { (action) -> Void in
            print("Saving...")
            
            let firstName =  alert.textFields![0].text!
            let lastName =  alert.textFields![1].text!
            
            self.dataSource.addPerson(firstName, lastName: lastName)
            
            //1) update the model
            //2) update the tableView
           // self.tableView.reloadData()
            
            self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.dataSource.people.count - 1, inSection: 0)], withRowAnimation: .Top)
        }))
        
        presentViewController(alert, animated: true){}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 10, inSection: 0)], withRowAnimation: .Left)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.people.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("personCell", forIndexPath: indexPath)
        
        let person = dataSource.people[indexPath.row]
        // Configure the cell...

        cell.textLabel?.text = person.firstName
        cell.detailTextLabel?.text = person.lastName
        return cell
    }
    



    var indexPath:NSIndexPath?
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let person = dataSource.people[indexPath.row]
        performSegueWithIdentifier("EditSegue", sender: person)
        self.indexPath = indexPath
    }
    
    override func viewWillAppear(animated: Bool) {
        if let path = indexPath{
            tableView.reloadRowsAtIndexPaths([path], withRowAnimation: .None)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let dest = segue.destinationViewController as? DetailsViewController{
            dest.data = (sender as! Person)
        }
    }
   
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
   
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            dataSource.delete(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
  

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
  

    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
