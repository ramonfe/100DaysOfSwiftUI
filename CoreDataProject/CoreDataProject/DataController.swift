//
//  DataController.swift
//  CoreDataProject
//
//  Created by Ramon Felix on 21/07/22.
//
import CoreData
import Foundation

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error{
                print("Core data failed to load: \(error.localizedDescription)")
                return
            }
            //permite guardar solo 1 registro en caso que el constraint detecte error
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
