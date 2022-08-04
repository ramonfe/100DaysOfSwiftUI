//
//  WrapUIVController.swift
//  Instafilter
//
//  Created by Ramon Felix on 02/08/22.
//

import SwiftUI

struct WrapUIVController: View {
    @State private var image: Image?
    @State private var showImagePicker = false
    @State private var inputImage:UIImage?
    
    var body: some View {
        VStack{
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image"){
                showImagePicker = true
            }
            Button("Save Image"){
                guard let inputImage = inputImage else { return }
                
                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbum(image: inputImage)

            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage() }
    }
    func loadImage(){
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }    
}







struct WrapUIVController_Previews: PreviewProvider {
    static var previews: some View {
        WrapUIVController()
    }
}
