//
//  DataController.swift
//  FriendFace
//
//  Created by Ramon Felix on 30/07/22.
//
import CoreData
import Foundation

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "UserModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
                return
            }
            //permite guardar solo 1 registro en caso que el constraint detecte error
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
