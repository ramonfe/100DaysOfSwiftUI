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
    private var hasImageName:Bool {
        if imageName.isEmpty || imageName.trimmingCharacters(in: .whitespaces).isEmpty{
            return false
        }
        return true
    }
    
    var userImages = [UserImage.example]
    
    var body: some View {
        NavigationView{
            List(viewModel.userImages){imagen in
                NavigationLink{
                    ImageView(userImage: imagen )
                }label: {
                    HStack{
                        //Image(systemName: "photo")
                        AsyncImage(url: URL(string: imagen.location), scale: 3 )
                        {image in image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }placeholder: {
                            ProgressView()
                        }
                        Text(imagen.name)
                    }
                }
            }
            .toolbar {
                Button{
                    imageName = ""
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
            VStack(spacing:20){
                TextField("Enter an image name", text: $imageName)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                    )
                Button("Save"){
                    viewModel.addImage(name: imageName, img: inputImage!)
                    imageSelected.toggle()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                )
                .disabled(hasImageName == false)
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
