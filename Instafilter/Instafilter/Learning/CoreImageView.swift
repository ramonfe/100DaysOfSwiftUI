//
//  CoreImageView.swift
//  Instafilter
//
//  Created by Ramon Felix on 01/08/22.
//

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
        image = Image("emi")
    }
}

struct CoreImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoreImageView()
    }
}
