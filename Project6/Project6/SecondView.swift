//
//  SecondView.swift
//  Project6
//
//  Created by Ramon Felix on 08/07/22.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        ZStack
        {
            RadialGradient(stops: [
                .init(color: Color(red:0.9,green: 0.5,blue: 2), location: 0.3),
                .init(color: Color(red:0.5,green: 255,blue: 255), location: 0.3)
            ],center: .top, startRadius: 200, endRadius: 500 )
            .ignoresSafeArea()
            VStack
            {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
