//
//  ContentView.swift
//  luxsoftone
//
//  Created by Ramon Felix on 16/08/22.
//

import SwiftUI

struct Todos: Codable{
    var title:String
    var details: Detail
}

struct Detail:Codable {
    var description: String
    var day: Int
    
    var naturalDay:String{
        switch day{
        case 1:
            return "Monday"
        case 2:
            return "Tuesday"
        case 3:
            return "Wenesday"
        case 4:
            return "Thursday"
        case 5:
            return "Friday"
        case 6:
            return "Saturday"
        default:
            return "Sunday"
        }
    }
}

struct ContentView: View {
    @State var data:[Todos] = []
    
    var body: some View {
        NavigationView{
            List{
                ForEach(data, id: \.title ){ todo in
                    Section{
                        Text(todo.title)
                            .font(.headline)
                        Text(todo.details.description)
                        Text("When: \(todo.details.naturalDay)").font(.footnote)
                    }
                }
            }
            .navigationTitle("Todos")
            }
            .onAppear{
                data = loadJSONData(filename: "JsonFile")
        }
    }
    
    func loadJSONData(filename: String) -> [Todos] {
        var jsonRet = [Todos]()
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("not found")
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode([Todos].self, from: data)
            jsonRet = jsonData
        } catch {
            print("error:\(error)")
        }
        return jsonRet
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
