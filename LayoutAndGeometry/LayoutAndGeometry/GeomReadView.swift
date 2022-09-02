//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by home on 01/09/22.
//

import SwiftUI

struct OuterView: View{
    var body: some View{
        VStack{
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View{
    var body: some View{
        HStack{
            Text("Left")
            GeometryReader{geo in
                Text("Center")
                    .background(.blue)
            }
            .background(.orange)
            Text("Right")
        }
    }
}

struct ContentView: View {
    var body: some View {
        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
