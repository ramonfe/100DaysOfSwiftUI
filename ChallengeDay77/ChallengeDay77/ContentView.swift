//
//  ContentView.swift
//  ChallengeDay77
//
//  Created by home on 18/08/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @Environment(\.dismiss) var dismiss
    
    @State private var inputImage: UIImage?
    @State private var imageSelected = false
    
    @State private var showingAddImage = false
    @State private var imageName = ""
    
    var userImages = [UserImage.example]
    
    var body: some View {
        NavigationView{
            List(userImages){imagen in
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
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in
            imageSelected = true
        }
        .sheet(isPresented: $imageSelected) {
            VStack{
                TextField("Enter an image name", text: $imageName)
                Button("Save"){
                    imageSelected.toggle()
                    //mandar objeto como parametros y salvar con append
                    //ver codigo de bucketlist
                    viewModel.save()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
