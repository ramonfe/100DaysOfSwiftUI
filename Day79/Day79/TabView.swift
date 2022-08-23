//
//  TabView.swift
//  Day79
//
//  Created by home on 23/08/22.
//

import SwiftUI

struct TabViewView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab ){
            Text("Tab1")
//                .onTapGesture {
//                    selectedTab = "Two"
//                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
            Text("Tab2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                //.tag("Two")
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewView()
    }
}
