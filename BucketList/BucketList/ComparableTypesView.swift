//
//  ContentView.swift
//  BucketList
//
//  Created by home on 08/08/22.
//

import SwiftUI

struct User:Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName:String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let users = [
        User(firstName: "Ramon", lastName: "Valle"),
        User(firstName: "Emiliano", lastName: "Felix"),
        User(firstName: "Carmen", lastName: "Garcia")
    ].sorted()
    
    var body: some View {
        List(users){ user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
