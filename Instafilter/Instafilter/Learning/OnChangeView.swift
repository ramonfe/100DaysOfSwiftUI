//
//  ContentView.swift
//  Instafilter
//
//  Created by Ramon Felix on 01/08/22.
//

import SwiftUI

struct OnChangeView: View {
    @State private var blurAmount = 0.0
    
    var body: some View {
        VStack{
            Text("hello")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) { newValue in
                    print("new value is \(newValue)")
                }
            
            Button("Random Blur"){
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

struct OnChangeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
