//
//  ImageView.swift
//  ChallengeDay77
//
//  Created by home on 18/08/22.
//

import SwiftUI

struct ImageView: View {
    let userImage: UserImage
    @State private var image: Image?
    var body: some View {
        NavigationView {
            VStack() {
                image?
                    .resizable()
                    .scaledToFit()
                    Spacer()
            }
            .onAppear(perform: loadImage)
            .navigationTitle(userImage.name )
        }
    }
    func loadImage(){
        if let imageData = try? Data(contentsOf: URL(string: userImage.location)!)
        {
            if let loadedImage = UIImage(data: imageData)
            {
                image = Image(uiImage: loadedImage)
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(userImage: UserImage.example)
    }
}
