//
//  ConfDialogView.swift
//  Instafilter
//
//  Created by Ramon Felix on 01/08/22.
//

import SwiftUI

struct ConfDialogView: View {
    @State private var showingConfirmation = false
    
    @State private var backGroundColor = Color.white
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 300, height: 300)
            .background(backGroundColor)
            .onTapGesture {
                showingConfirmation=true
            }
            .confirmationDialog("no matter", isPresented: $showingConfirmation) {
                Button("Red"){backGroundColor = .red}
                Button("Green"){backGroundColor = .green}
                Button("Blue"){backGroundColor = .blue}
            } message: {
                Text("Select a new Color")
            }
            .onChange(of: showingConfirmation) { newValue in
                print("Value \(showingConfirmation) change to \(backGroundColor)")
            }
    }
}

struct ConfDialogView_Previews: PreviewProvider {
    static var previews: some View {
        ConfDialogView()
    }
}
