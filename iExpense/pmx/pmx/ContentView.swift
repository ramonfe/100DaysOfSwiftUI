//
//  ContentView.swift
//  pmx
//
//  Created by home on 19/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MoviesView(tab: "Cartelera")
            .tabItem {
                    Label("Cartelera", systemImage: "theatermasks")
                }
            MoviesView(tab: "Etrenos")
            .tabItem {
                    Label("Estrenos", systemImage: "film")
                }
            MoviesView(tab: "Streaming")
            .tabItem {
                    Label("Streaming", systemImage: "play.tv.fill")
                }
            MoviesView(tab: "Settings")
            .tabItem {
                    Label("Settings", systemImage: "config")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
