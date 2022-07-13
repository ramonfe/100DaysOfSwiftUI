//
//  ContentView.swift
//  Moonshot
//
//  Created by Ramon Felix on 09/07/22.
//

import SwiftUI

struct ContentView: View {
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    @State private var showingGrid = true
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView{
            Group{
                if showingGrid{
                    GridView(astronauts: astronauts, missions: missions)
                }else{
                    ListView(astronauts: astronauts, missions: missions)
                }
            }
            .toolbar{
                Button{
                    showingGrid.toggle()
                }label: {
                    Image(systemName: showingGrid ? "rectangle.grid.1x2" : "rectangle.grid.2x2")
                }
            }
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
