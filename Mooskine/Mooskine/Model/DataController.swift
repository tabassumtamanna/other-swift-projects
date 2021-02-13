//
//  DataController.swift
//  Mooskine
//
//  Created by Tabassum Tamanna on 2/12/21.
//  Copyright © 2021 Udacity. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    let persistentContainer:NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName: String){
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil){
        persistentContainer.loadPersistentStores { storeDescrioton, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            completion?()
            
        }
    }
}
