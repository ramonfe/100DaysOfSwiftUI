//
//  ResultTypeView.swift
//  Day80
//
//  Created by home on 23/08/22.
//

import SwiftUI

struct ResultTypeView: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    func fetchReadings() async{
        let fetchTask = Task{ () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            //output = "Found \(readings.count) readings."
            return "Found \(readings.count)"
        }
        
        let result = await fetchTask.result
        
        switch result{
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Donwload Error \(error.localizedDescription)"
        }
    }
}

struct ResultTypeView_Previews: PreviewProvider {
    static var previews: some View {
        ResultTypeView()
    }
}
