//
//  LaunchSpacXDetailLocal.swift
//  SpaceX
//
//  Created by david on 9/7/23.
//  Copyright © 2023 kavoskhajavi. All rights reserved.
//

import Foundation
import CoreData

let localSaceXDetail = LauncSpaceXDetailLocalImp(coreDataSource: coreDataSource)


protocol LaunchSpaceXDetailLocal {
    
    func creatBookMark(id:String,name:String)
    
    func deleteBookMark(id:String)
    
    func isBookMark(id:String,completion:@escaping(Bool) -> Void)
}

class LauncSpaceXDetailLocalImp: LaunchSpaceXDetailLocal {
    
    var coreDataSource:CoreDataSource
    
    init(coreDataSource:CoreDataSource) {
        self.coreDataSource = coreDataSource
    }
    
    
    func getDataById(id:String) -> [LauncSpaceXTable?] {
        
        do {
            let fetch = NSFetchRequest<LauncSpaceXTable>(entityName: "LauncSpaceXTable")
            fetch.fetchLimit = 1
            fetch.predicate = NSPredicate(format: "id =%@", id)
            let request = try coreDataSource.getContextCoredata().fetch(fetch)
            return request
        } catch  {
            print("Fetch user error",error)
            return []
        }
    }
    
    func creatBookMark(id: String, name: String) {
        let data = LauncSpaceXTable(context: coreDataSource.getContextCoredata())
        data.id = id
        data.name = name
        coreDataSource.saveContext()
    }
    
    func deleteBookMark(id: String) {
        let data =  getDataById(id: id)
        if data.count > 0 {
            coreDataSource.getContextCoredata().delete(data[0]!)
            coreDataSource.saveContext()
        }
        
    }
    
    func isBookMark(id:String,completion:@escaping(Bool) -> Void) {
        let request = getDataById(id: id)
        if request.count > 0 {
            completion(true)
        } else {
            completion(false)
        }
        
    }
    
}
