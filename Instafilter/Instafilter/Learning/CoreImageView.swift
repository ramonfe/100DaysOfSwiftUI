//
//  CoreImageView.swift
//  Instafilter
//
//  Created by Ramon Felix on 01/08/22.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct CoreImageView: View {
    @State private var image: Image?
    
    var body: some View {
        VStack{
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    func loadImage(){
        //image = Image("emi")
        
        guard let inputImage = UIImage(named: "emi")else{return}
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.crystallize()
        currentFilter.inputImage = beginImage

        let amount = 1.0

        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey) }
        
        // get a CIImage from our filter or exit if that fails
        guard let ciImageOutput = currentFilter.outputImage else {return}
        if let cgImage = context.createCGImage(ciImageOutput, from: ciImageOutput.extent){
            let uiImage = UIImage(cgImage: cgImage)
            //convert to swuitui image
            image = Image(uiImage: uiImage)
        }
        
       
    }
}






struct CoreImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoreImageView()
    }
}
