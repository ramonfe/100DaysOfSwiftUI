//
//  MeView.swift
//  Project16
//
//  Created by home on 23/08/22.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    @State private var name = "Anonymous"
    @State private var emailAddress = "you@yoursite.com"
    @State private var qrCode = UIImage()
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)
                TextField("Email", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                Image(uiImage:qrCode)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .contextMenu{
                        Button{
                            let imageSaver = ImageSaver()
                            imageSaver.writeToPhotoAlbum(image: qrCode)
                        }label: {
                            Label("Save to photos", systemImage: "square.and.arrow.down")
                        }
                    }
            }
            .navigationTitle("Your Code")
            .onAppear(perform: updateQrCode)
            .onChange(of: name){_ in updateQrCode() }
            .onChange(of: emailAddress) { _ in updateQrCode() }
        }
    }
    func updateQrCode(){
        qrCode = generateQrCode(from: "\(name)\n\(emailAddress)")
    }
    func generateQrCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage{
            if let cgimage = context.createCGImage(outputImage, from: outputImage.extent){
                qrCode = UIImage(cgImage: cgimage)
                return qrCode
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct MeView_Previews: PreviewProvider {
    static var previews: some View {
        MeView()
    }
}
