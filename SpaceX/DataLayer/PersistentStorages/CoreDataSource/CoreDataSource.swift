//
//  CoreDataSource.swift
//  SpaceX
//
//  Created by david on 9/7/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation
import CoreData

let coreDataSource = CoreDataSource()

class CoreDataSource {
    
    let container:NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "SpaceX")
        container.loadPersistentStores {description,error in
            if error != nil{
                fatalError("Cannot Load Core Data Model")
            }
            
        }
    }
    
    func getContextCoredata() -> NSManagedObjectContext {
        return container.viewContext
    }
    
     func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch  {
                fatalError("Error:\(error.localizedDescription)")
            }
        }
    }
}
