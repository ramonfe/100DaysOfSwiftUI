//
//  ContentView.swift
//  ChallengeDay77
//
//  Created by home on 18/08/22.
//

import SwiftUI

struct UserImages{
    var name:String
    var location:String
}

struct ContentView: View {
    @State private var showingAddImage = false
    var userImages = [
    UserImages(name: "Playa", location: "Unknown"),
    UserImages(name: "Atardecer", location: "Unknown")
    ]
    var body: some View {
        NavigationView{
            List(userImages,id: \.name){imagen in
                NavigationLink{
                    ImageView()
                }label: {
                    HStack{
                        Image(systemName: "photo")
                        Text(imagen.name)
                    }
                }
            }
            .toolbar {
                Button{
                    showingAddImage.toggle()
                }label: {
                    Label("Add Image", systemImage: "plus")
                }
                
            }
            .navigationTitle("User Pictures")
        }
        .sheet(isPresented: $showingAddImage) {
            SelectImageView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
