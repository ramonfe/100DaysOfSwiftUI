//
//  ContentView.swift
//  luxsoftone
//
//  Created by Ramon Felix on 16/08/22.
//

import SwiftUI

struct Todos: Codable{
    //var id = UUID()
    var title:String
    var details: Detail
}

struct Detail:Codable {
    var description: String
    var day: Int
}

struct ContentView: View {
    @State var data:[Todos] = []
    
    var body: some View {
        VStack{
            List{
                ForEach(data ){ todo in
                Text(todo.title)
                    .padding()
            }
            }
            .onAppear{
                data = loadJSONData(filename: "JsonFile")
                
            }
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
