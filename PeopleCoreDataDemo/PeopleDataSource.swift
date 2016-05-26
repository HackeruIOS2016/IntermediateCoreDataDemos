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
    
    func delete(index:Int){
        let person = people[index]

        context.deleteObject(person)
        do{
            try context.save()
            people.removeAtIndex(index)
        }
        catch let e as NSError{
            print(e)
        }
    }
    
    func fetchPeople(){
        let request = NSFetchRequest(entityName: "Person")
        request.sortDescriptors = [NSSortDescriptor(key: "firstName", ascending: true)]
        
        do{
            people = try context.executeFetchRequest(request) as! [Person]
        }
        catch let e as NSError{
            print(e)
        }
    }
    
    func addPerson(firstName:String, lastName:String){
        let personTable = NSEntityDescription.entityForName("Person", inManagedObjectContext: context)!
        
        let person = Person(entity: personTable, insertIntoManagedObjectContext: context)
        
        person.firstName = firstName// setValue(firstName, forKey: "firstName")
        person.lastName = lastName// setValue(lastName, forKey: "lastName")
        
        do{
            try context.save()
        }
        catch let e as NSError{
            print(e)
        }
       // let p = Person(firstName: firstName, lastName: lastName)
        people.append(person)
        //fetchPeople()
    }
}
