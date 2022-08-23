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
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 32.525, longitude: -117.03), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @State private var image: Image?
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0)
            {
                image?
                    .resizable()
                    .scaledToFit()
                    
                  Text("Taked at:")
                    .font(.subheadline)
                    .padding([.top, .bottom])
                Map(coordinateRegion: $mapRegion, interactionModes: .all, //showsUserLocation: true,
                 annotationItems: [userImage]) { location in
                    MapMarker(coordinate: location.coordinate)
                }
            }
            .padding()
            .navigationTitle(userImage.name)
            //.navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: loadImage)
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
