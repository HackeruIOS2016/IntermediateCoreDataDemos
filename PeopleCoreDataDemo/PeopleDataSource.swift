//
//  PeopleDataSource.swift
//  PeopleCoreDataDemo
//
//  Created by HackerU on 26/05/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//

import UIKit
import CoreData

class PeopleDataSource {
    var appDelegate:AppDelegate!
    var context:NSManagedObjectContext!
    var people = [Person]()
    
   init() {
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        context = appDelegate.managedObjectContext
    
        fetchPeople()
    }
    
    
    func fetchPeople(){
        let request = NSFetchRequest(entityName: "Person")
        do{
            let peopleArray = try context.executeFetchRequest(request)
            
                people.removeAll()
            for p in peopleArray{
                let firstName = p.valueForKey("firstName") as! String
                let lastName = p.valueForKey("lastName") as! String
                
                let person = Person(firstName: firstName, lastName: lastName)
                people.append(person)
            }
        }
        catch let e as NSError{
            print(e)
        }
    }
    
    func addPerson(firstName:String, lastName:String){
        let personTable = NSEntityDescription.entityForName("Person", inManagedObjectContext: context)!
        
        let person = NSManagedObject(entity: personTable, insertIntoManagedObjectContext: context)
        
        person.setValue(firstName, forKey: "firstName")
        person.setValue(lastName, forKey: "lastName")
        
        do{
            try context.save()
        }
        catch let e as NSError{
            print(e)
        }
        let p = Person(firstName: firstName, lastName: lastName)
        people.append(p)
        //fetchPeople()
    }
}
