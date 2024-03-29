//
//  ReadingValue.swift
//  AccessibilitySandBox
//
//  Created by home on 11/08/22.
//

import SwiftUI

struct ReadingValue: View {
    @State private var value = 10
    
    var body: some View {
        VStack{
            Text("Value:\(value)")
            
            Button("Cincrement"){
                value+=1
            }
            
            Button("Decrement"){
                value -= 1
            }
        }
        .accessibilityElement()
        .accessibilityLabel("Value")
        .accessibilityValue(String(value))
        .accessibilityAdjustableAction { direction in
            switch direction{
            case .increment:
                value += 1
            case.decrement:
                value -= 1
            default:
                print("not handled")
            }
        }
    }
}

struct ReadingValue_Previews: PreviewProvider {
    static var previews: some View {
        ReadingValue()
    }
}
