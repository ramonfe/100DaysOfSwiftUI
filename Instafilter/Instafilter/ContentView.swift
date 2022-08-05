//
//  ContentView.swift
//  Instafilter
//
//  Created by Ramon Felix on 04/08/22.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    @State private var showingImagePicture = false
    @State private var inputImage:UIImage?
    
    @State private var currentFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    var body: some View {
        NavigationView{
            VStack{
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
                    showingImagePicture = true
                }
                
                HStack{
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity){ _ in applyProcessing() }
                }
                .padding(.vertical)
                
                HStack{
                    Button("Change filter"){
                        //change
                    }
                    Spacer()
                    Button("save", action: save)
                }
            }
            .padding([.horizontal,.bottom])
            .navigationTitle("Instafilter")
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicture) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    func loadImage(){
        guard let inputImage = inputImage else { return }
//        image = Image(uiImage: inputImage)
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func save(){
        
    }
    
    func applyProcessing(){
        currentFilter.intensity = Float(filterIntensity)
        guard let outputImage = currentFilter.outputImage else {return}
        
        if let cgimage = context.createCGImage(outputImage, from: outputImage.extent){
            let uiImage = UIImage(cgImage: cgimage)
            image = Image(uiImage: uiImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
