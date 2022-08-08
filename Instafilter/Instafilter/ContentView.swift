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
    @State private var filterRadius = 150.0
    
    @State private var showingImagePicture = false
    @State private var inputImage:UIImage?
    @State private var processedImage:UIImage?
    
    @State private var currentFilter:CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @State private var showingFilterSheet = false
    @State private var hasImage = false
    
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
                HStack{
                    Text("Radius")
                    Slider(value: $filterRadius, in: 1...300)
                        .onChange(of: filterRadius){_ in applyProcessing() }
                    
                }
                .padding(.vertical)
                
                HStack{
                    Button("Change filter"){
                        showingFilterSheet = true
                    }
                    Spacer()
                    Button("save", action: save)
                        .disabled(hasImage==false)
                }
            }
            .padding([.horizontal,.bottom])
            .navigationTitle("Instafilter")
            .onChange(of: inputImage) { _ in loadImage() }
            .sheet(isPresented: $showingImagePicture) {
                ImagePicker(image: $inputImage)
            }
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                Section{
                    Button("Cristallize"){setFilter(CIFilter.crystallize())}
                    Button("Edges"){setFilter(CIFilter.edges())}
                    Button("Gaussian Blur"){setFilter(CIFilter.gaussianBlur())}
                    Button("Pixellate"){setFilter(CIFilter.pixellate())}
                    Button("Sepia Tone"){setFilter(CIFilter.sepiaTone())}
                    Button("Unsharp Mask"){setFilter(CIFilter.unsharpMask())}
                }
                Section{
                    Button("Vignette"){setFilter(CIFilter.vignette())}
                    Button("Distortion"){setFilter(CIFilter.twirlDistortion())}
                    Button("Comic"){setFilter(CIFilter.comicEffect())}
                    Button("Bloom"){setFilter(CIFilter.bloom())}
                    Button("Line Overlay"){setFilter(CIFilter.lineOverlay())}
                    Button("Cancel", role: .cancel){}
                }
            }
        }
    }
    
    func loadImage(){
        guard let inputImage = inputImage else { return }
        //        image = Image(uiImage: inputImage)
        hasImage = true
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func save(){
        guard let processedImage = processedImage else {return}
        
        let imageSaver = ImageSaver()
        
        imageSaver.successHandler = {
            print("Success!")
        }
        imageSaver.errorHandler = {
            print("Error: \($0.localizedDescription)")
        }
        imageSaver.writeToPhotoAlbum(image: processedImage)
    }
    
    func applyProcessing(){
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey){currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)}
        if inputKeys.contains(kCIInputRadiusKey){currentFilter.setValue(filterRadius, forKey: kCIInputRadiusKey)}
        if inputKeys.contains(kCIInputScaleKey){currentFilter.setValue(filterIntensity *  10, forKey: kCIInputScaleKey)}
        //currentFilter.intensity = Float(filterIntensity)
        
        guard let outputImage = currentFilter.outputImage else {return}
        
        if let cgimage = context.createCGImage(outputImage, from: outputImage.extent){
            let uiImage = UIImage(cgImage: cgimage)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    func setFilter(_ filter: CIFilter){
        currentFilter = filter
        loadImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
