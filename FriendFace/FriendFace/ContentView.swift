//
//  ContentView.swift
//  FriendFace
//
//  Created by Ramon Felix on 28/07/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext)var moc
    @FetchRequest(sortDescriptors: [])var cachedUser: FetchedResults<CdUser>
    
    @State private var users = [User]()
 
    var body: some View {
        NavigationView{
            List(cachedUser, id: \.self ){user in
                NavigationLink{
                    DetailView(user: user)
                    //Text(user.name!)
                } label: {
                    HStack{
                        Label("", systemImage: user.isActive ? "person.fill.checkmark" : "person.fill.xmark")
                            .labelsHidden()
                            .font(.largeTitle)
                        VStack(alignment: .leading){
                            Text(user.name!)
                                .font(.headline)
                            Text("Company: \(user.company! )")
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
                //to avoid update coredata in middle of updating user interface
                await MainActor.run{
                    addCachedUser(users: users)
                }
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
    func addCachedUser(users: [User]){
        for user in users {
            for friend in user.friends{
                let friendCached = CdFriend(context: moc)
                friendCached.id = friend.id
                friendCached.name = friend.name
                friendCached.origin = CdUser(context: moc)
                friendCached.origin?.id = user.id
                friendCached.origin?.isActive = user.isActive
                friendCached.origin?.name = user.name
                friendCached.origin?.age = Int16(user.age)
                friendCached.origin?.company = user.company
                friendCached.origin?.email = user.email
                friendCached.origin?.address = user.email
                friendCached.origin?.about = user.about
                friendCached.origin?.registered = user.registered
                friendCached.origin?.tags = user.tags.joined(separator: ", ")
                do{
                    if moc.hasChanges{
                        try moc.save()
                    }
                }catch let error{
                    print("Adding CoreData Err: \(error.localizedDescription)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
