//
//  ContentView.swift
//  Day60
//
//  Created by Ramon Felix on 27/07/22.
//

import SwiftUI

extension View{
    func erasedToAnyView() -> AnyView{
        AnyView(self)
    }
}

struct ContentView: View {
//    var randomText: some View{
//        Text("Hello True")
//            .frame(width: Bool.random() ? 300 : nil)
//    }
    @State private var views = [AnyView]()
    var body: some View {
        VStack{
            Text("Hola").font(.title).erasedToAnyView()
            
            Button("Add Shape"){
                if Bool.random(){
                    views.append(AnyView(Circle().frame(height:50)))
                }else {
                    views.append(AnyView(Rectangle().frame(width:50)))
                }
            }
            ForEach(0..<views.count, id:\.self){
                views[$0]
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
