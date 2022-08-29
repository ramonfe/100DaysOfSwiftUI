//
//  ContentView.swift
//  Flashzilla
//
//  Created by home on 25/08/22.
//

import SwiftUI

struct GesturesView: View {
    @State private var currentAmount = Angle.zero// 0.0
    @State private var finalAmount = Angle.zero// 1.0
    
    var body: some View {
        VStack{
            Text("Hola mundo")
                .onTapGesture {
                    print("text tapped")
                }
        }
        //.highPriorityGesture(
        .simultaneousGesture(
            TapGesture()
                .onEnded{
                    print("Vstack tapped®")
                }
        )
        
        Text("Hello, world!")
            .rotationEffect(currentAmount + finalAmount)
            //.scaleEffect(finalAmount + currentAmount)
            .gesture(
                RotationGesture()
//                MagnificationGesture()
                    .onChanged{ amount in
                        currentAmount = amount //- 1
                    }
                    .onEnded{ amount in
                        finalAmount += currentAmount
                        currentAmount = .zero// 0
                    }
            )
        
        
        //            .onLongPressGesture(minimumDuration: 3) {
        //                print("long pressed")
        //            } onPressingChanged: { inProgress in
        //                print("in progress: \(inProgress)")
        //            }
    }
}

struct GesturesView_Previews: PreviewProvider {
    static var previews: some View {
        GesturesView()
    }
}
