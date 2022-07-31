//
//  User.swift
//  FriendFace
//
//  Created by Ramon Felix on 30/07/22.
//

import SwiftUI

struct User:Codable {
    struct Friend:Codable, Identifiable {
        var id:String
        var name:String
    }
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company, email, address, about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}
