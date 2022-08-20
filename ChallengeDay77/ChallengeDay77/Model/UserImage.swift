//
//  UserImage.swift
//  ChallengeDay77
//
//  Created by home on 19/08/22.
//

import Foundation

struct UserImage:Identifiable, Codable, Comparable{
    var id:UUID
    var name:String
    var location:String
    
    static let example = UserImage(id: UUID(), name: "Playa", location: "Unknown")
    
    static func < (lhs: UserImage, rhs: UserImage) -> Bool {
        lhs.name < rhs.name
    }
}
