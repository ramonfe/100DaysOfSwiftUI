//
//  ContentView.swift
//  FriendFace
//
//  Created by Ramon Felix on 28/07/22.
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

struct ContentView: View {
    @State private var users = [User]()
 
    var body: some View {
        NavigationView{
            List(users, id: \.id ){user in
                NavigationLink{
                    DetailView(user: user)
                } label: {
                    HStack{
                        Label("", systemImage: user.isActive ? "person.fill.checkmark" : "person.fill.xmark")
                            .labelsHidden()
                            .font(.largeTitle)
                        VStack(alignment: .leading){
                            Text(user.name)
                                .font(.headline)
                            Text("Company: \(user.company )")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Users")
        }
        .task {
            if users.isEmpty{
                await getJson()
            }
        }
    }
    
    func getJson() async{
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            //Uncomment for debug
//            if let dataAsString = String(data: data, encoding: .utf8){
//                print(dataAsString)
//            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let decodedUser =  try? decoder.decode([User].self, from: data)
            {
                users = decodedUser
            }
            
            
        } catch let jsonError{
            print(jsonError)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
