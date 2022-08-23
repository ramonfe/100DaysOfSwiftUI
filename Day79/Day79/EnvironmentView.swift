//
//  ContentView.swift
//  Day79
//
//  Created by home on 23/08/22.
//

import SwiftUI

@MainActor class User: ObservableObject{
    @Published var name = "Ramon Felix"
}

struct EditView: View{
    @EnvironmentObject var user: User
    
    var body: some View{
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View{
    @EnvironmentObject var user: User
    
    var body: some View{
        Text(user.name)
    }
}

struct ContentView: View {
    @StateObject var user = User()
    
    var body: some View{
        VStack{
            EditView()
            DisplayView()
        }
        .padding()
        .environmentObject(user)
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
