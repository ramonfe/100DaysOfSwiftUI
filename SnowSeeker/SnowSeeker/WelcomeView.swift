//
//  Welcome.swift
//  SnowSeeker
//
//  Created by home on 08/09/22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack{
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            
            Text("Please select a resport from the left-hand menu.")
                .foregroundColor(.secondary)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
