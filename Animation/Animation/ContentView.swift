//
//  ContentView.swift
//  Animation
//
//  Created by Ramon Felix on 06/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount=0.0
    @State private var enabled = false
    
    var body: some View {
        VStack{
            
            HStack{
                Button("Tape Me"){
                    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                        animationAmount+=360
                    }
                }
                .padding(50)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
                Button("Also Tape Me"){
                    enabled.toggle()
                }
                .frame(width: 200, height: 200)
                .background( enabled ? .blue : .red)
                .animation(.default, value: enabled)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
                .animation(.default, value: enabled)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
