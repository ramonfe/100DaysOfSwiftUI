//
//  ContentView.swift
//  iExpense
//
//  Created by Ramon Felix on 08/07/22.
//

import SwiftUI

class User2:ObservableObject {
    @Published var name="ramon"
    @Published var lastName="felix"
}

struct SecondView: View{
    @Environment(\.dismiss) var dismiss
    let name:String
    var body: some View{
        Button("Dismiss"){
            dismiss()
        }
    }
}
struct otherView:View{
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(numbers, id: \.self){
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                Button("Add number"){
                    numbers.append(currentNumber)
                    currentNumber+=1
                }
            }
            .navigationTitle("onDelete()")
            .toolbar {
                EditButton()
            }
        }
    }
    func removeRows(at offsets: IndexSet){
        numbers.remove(atOffsets: offsets)
    }
}
struct User:Codable{
    let firstName:String
    let lastName:String
}

struct ContentView: View {
    @State private var user = User(firstName: "ramon", lastName: "felix")
    var body: some View {
        Button("Save user"){
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user){
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct UsersDefaultView:View{
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    var body: some View{
        Button("tapcount \(tapCount)"){
            tapCount += 1
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
