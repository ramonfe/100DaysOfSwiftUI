//
//  ScrollEfectView.swift
//  LayoutAndGeometry
//
//  Created by home on 02/09/22.
//

import SwiftUI

struct ScrollEfectView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false){
//            HStack(spacing: 0){
//                ForEach(0..<20){ number in
//                    GeometryReader{ geo in
//                        Text("Number \(number)")
//                            .font(.largeTitle)
//                            .padding()
//                            .background(.red)
//                            .rotation3DEffect(.degrees(-geo.frame(in: .global).minX) / 8, axis: (x: 0, y:1, z:0))
//                            .frame(width: 200, height: 200)
//                    }
//                    .frame(width: 200, height: 200)
//                }
//            }
//        }
        
        GeometryReader{ fullview in
            ScrollView{
                ForEach(0..<50){ index in
                    GeometryReader{ geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: min(1,geo.frame(in: .global).minY / fullview.size.height), saturation: 1, brightness:1 ))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullview.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(geo.frame(in: .global).minY / 200)
                            .scaleEffect(max(0.5, geo.frame(in: .global).minY / 400))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct ScrollEfectView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollEfectView()
    }
}
