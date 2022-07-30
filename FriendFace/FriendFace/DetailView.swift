//
//  DetailView.swift
//  FriendFace
//
//  Created by Ramon Felix on 29/07/22.
//

import SwiftUI

struct DetailView: View {
    let user:User
    @State  private var friendsList=""
    /*
     let company, email, address, about: String
     let registered: Date?
     let tags: [String]
     let friends: [Friend]
     */
    
    var body: some View {
        VStack{
            Text("User").font(.headline)
                .foregroundColor(.secondary)
        Text(user.name)
                .font(.title)
            Form{
                Section("User Information"){
                    Text("Age: \(user.age)")
                    Text("Email: \(user.email)")
                    Text("Registered: \(user.registered.formatted(date: .abbreviated, time: .omitted))")
                    Text("Friends: \(friendArray(friends: user.friends))")
                }
                Section("Company Information"){
                    Text("Name: \(user.company)")
                    Text("Address: \(user.address)")
                    Text("About: \(user.about)")
                    Text("Tags: \(user.tags.joined(separator: ","))")
                }
            }
        }
    }
    func friendArray(friends: [User.Friend]) -> String{
        var friendStr = ""
        for friend in friends {
            friendStr.append(friend.name + ",")
        }
        friendStr = String(friendStr.dropLast())
        return friendStr
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let dateFormatter = DateFormatter()
//        let date = dateFormatter.date(from: "10/10/2022")
//        let user = User(id: "123", isActive: true, name: "Ramon", age: 48, company: "Zeiss", email: "ramon@zeiss.com", address: "someone", about: "very cool guy", registered: date, tags: ["cool","Boos"], friends: [User.Friend.init(id: "1", name: "Random")])
//        DetailView(user: user)
//    }
//}
