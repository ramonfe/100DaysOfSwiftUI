//
//  CacheUser+CoreDataProperties.swift
//  FriendFace
//
//  Created by Ramon Felix on 31/07/22.
//
//

import Foundation
import CoreData


extension CacheUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CacheUser> {
        return NSFetchRequest<CacheUser>(entityName: "CacheUser")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var friend: NSSet?

}

// MARK: Generated accessors for friend
extension CacheUser {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: CacheFriend)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: CacheFriend)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}

extension CacheUser : Identifiable {

}
