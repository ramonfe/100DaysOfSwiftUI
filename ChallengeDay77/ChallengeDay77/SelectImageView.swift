//
//  SelectImageView.swift
//  ChallengeDay77
//
//  Created by home on 18/08/22.
//

import SwiftUI

struct SelectImageView: View {
    @Environment(\.dismiss)var dismiss
    
    @State var image: Image?
    @State var picName = ""
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var hasImage = false
    private var hasPicName:Bool {
        if picName.isEmpty || picName.trimmingCharacters(in: .whitespaces).isEmpty || hasImage == false {
            return false
        }else{
            return true
        }
    }
    
    var body: some View {
        VStack{
            Section{
                ZStack{
                    Rectangle()
                        .fill(.secondary)
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
            }
            
            HStack{
                TextField("Enter pic name", text: $picName)
                Spacer()
                Button("Save"){
                    dismiss()
                }
                .disabled(hasPicName == false)
            }
            .padding(.vertical)
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(
                image: $inputImage )
        }
        .onChange(of: inputImage, perform: { _ in
            loadImage()
        })
    }
    func loadImage(){
        guard let inputImage = inputImage else {
            return
        }
        hasImage = true
        image = Image(uiImage: inputImage)
    }
}

struct SelectImageView_Previews: PreviewProvider {
    static var previews: some View {
        SelectImageView()
    }
}
