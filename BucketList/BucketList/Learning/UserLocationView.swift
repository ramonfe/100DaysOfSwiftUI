//
//  UserLocationView.swift
//  BucketList
//
//  Created by Ramon Felix on 08/08/22.
//

import MapKit
import SwiftUI

struct UserLocationView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    @State private var locations = [Location]()
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $mapRegion, annotationItems: locations){location in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.latitud, longitude: location.longitud))
            }
                .ignoresSafeArea()
            
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button{
                        let newLocation  = Location(id: UUID(), name: "New Location", description: "", latitud: mapRegion.center.latitude, longitud: mapRegion.center.longitude)
                        locations.append(newLocation)
                        
                    }label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
    }
}

struct UserLocationView_Previews: PreviewProvider {
    static var previews: some View {
        UserLocationView()
    }
}
