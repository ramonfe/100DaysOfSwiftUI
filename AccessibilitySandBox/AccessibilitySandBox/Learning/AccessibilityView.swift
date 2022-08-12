//
//  ContentView.swift
//  AccessibilitySandBox
//
//  Created by home on 11/08/22.
//

import SwiftUI

struct AccessibilityView: View {
    let pictures = [
        "kevin-horstmann-141705","ales-krivec-15949","galina-n-189483"]
    let labels = [
        "Tulips","Frozen tree buds","Sunflowers"]
    @State private var imageSelected = Int.random(in: 0...2)
    
    var body: some View {
        VStack{
            VStack{
                Text("your score is")
                Text("1000")
                    .font(.title)
            }
            .accessibilityElement(children: .combine)
            //or
            .accessibilityElement()
            .accessibilityLabel("Your Score is 1000")
            
            Image(decorative: "character")
            Image(pictures[imageSelected])
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    imageSelected = Int.random(in: 0...2)
                }
                .accessibilityLabel(labels[imageSelected])
                .accessibilityAddTraits(.isButton)
                .accessibilityRemoveTraits(.isImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AccessibilityView()
    }
}
