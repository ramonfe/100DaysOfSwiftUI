//
//  CacheFriend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Ramon Felix on 31/07/22.
//
//

import Foundation
import CoreData


extension CacheFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CacheFriend> {
        return NSFetchRequest<CacheFriend>(entityName: "CacheFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: CacheUser?

}

extension CacheFriend : Identifiable {

}
