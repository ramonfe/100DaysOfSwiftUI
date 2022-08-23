//
//  ImageView.swift
//  ChallengeDay77
//
//  Created by home on 18/08/22.
//

import SwiftUI
import MapKit

struct ImageView: View { 
    let userImage: UserImage
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    @State private var image: Image?
    var body: some View {
        NavigationView {
            VStack{
                image?
                    .resizable()
                    .scaledToFit()
                    Spacer()
                Map(coordinateRegion: $mapRegion)
//                , annotationItems: userImage) { location in
//                    MapAnnotation(coordinate: location.coordinate) {
//                        VStack{
//                            Image(systemName: "star.cricle")
//                                .resizable()
//                                .foregroundColor(.red)
//                                .frame(width: 44, height: 44)
//                                .background(.white)
//                                .clipShape(Circle())
//
//                            Text(location.name)
//                                .fixedSize()
//                        }
//                    }
//                }
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
