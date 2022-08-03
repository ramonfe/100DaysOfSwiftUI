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
    
    var body: some View {
        VStack{
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image"){
                showImagePicker = true
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker()
        }
    }
}







struct WrapUIVController_Previews: PreviewProvider {
    static var previews: some View {
        WrapUIVController()
    }
}
