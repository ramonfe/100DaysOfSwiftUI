//
//  CdUser+CoreDataProperties.swift
//  FriendFace
//
//  Created by Ramon Felix on 31/07/22.
//
//

import Foundation
import CoreData


extension CdUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CdUser> {
        return NSFetchRequest<CdUser>(entityName: "CdUser")
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
    
    public var friendArray:[CdFriend]{
        let set = friend as? Set<CdFriend> ?? []
            
            return set.sorted{
                $0.wrappedName < $1.wrappedName
            }
        }


}

// MARK: Generated accessors for friend
extension CdUser {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: CdFriend)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: CdFriend)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}

extension CdUser : Identifiable {

}
