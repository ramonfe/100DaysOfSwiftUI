//
//  CdFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Ramon Felix on 31/07/22.
//
//

import Foundation
import CoreData


extension CdFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CdFriend> {
        return NSFetchRequest<CdFriend>(entityName: "CdFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: CdUser?
    
    public var wrappedName:String{
        name ?? "Unknown Friend"
    }

}

extension CdFriend : Identifiable {

}
