//
//  ContentView.swift
//  Day81
//
//  Created by home on 23/08/22.
//

import SwiftUI

struct ContextMnuView: View {
    @State private var backColor:Color = .blue
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .background(backColor)
            .contextMenu(){
                Button(role: .destructive){
                    backColor = .red
                }label: {
                    Label("Red", systemImage: "checkmark.circle.fill")
                }
                Button("Green"){
                    backColor = .green
                }
                Button("Blue"){
                    backColor = .blue
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContextMnuView()
    }
}
