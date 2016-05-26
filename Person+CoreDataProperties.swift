//
//  Person+CoreDataProperties.swift
//  PeopleCoreDataDemo
//
//  Created by HackerU on 26/05/2016.
//  Copyright © 2016 HackerU. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var firstName: String
    @NSManaged var lastName: String

}
