//
//  ContentView.swift
//  Project6
//
//  Created by Ramon Felix on 07/07/22.
//

import SwiftUI

//custom modifier
struct RoundBtn: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 80, height: 60)
            .background(.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}
extension View{
    func RoundButton()-> some View{
        modifier(RoundBtn())
    }
}
struct ContentView: View {
    @State private var table = 2
    @State private var games = 5
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            HStack{
                VStack{
                    Text("Wich Times Table?").font(.headline)
                    Text("\(table) X").font(.largeTitle).bold()
                    Stepper("", value: $table,in: 2...12, step: 1)
                        .labelsHidden()
                }
                Spacer()
                VStack{
                    Text("How Many Games?").font(.headline)
                    Text("\(games) Games").font(.largeTitle).bold()
                    Stepper("", value: $games,in: 5...20, step: 5)
                        .labelsHidden()
                }
            }
            Spacer()
            Button("Play"){}
                .padding(50)
                .background(.yellow)
                .clipShape(Circle())
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .bold))
                Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
