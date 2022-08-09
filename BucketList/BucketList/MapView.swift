//
//  MapView.swift
//  BucketList
//
//  Created by home on 08/08/22.
//

import MapKit
import SwiftUI

struct Location: Identifiable{
    let id = UUID()
    let name:String
    let coordinate:CLLocationCoordinate2D
}

struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12),span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Location(name: "Palacio de Buckingham", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Torre de Londres", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $mapRegion, annotationItems: locations){ location in
                //MapMarker(coordinate: location.coordinate)
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink{
                        Text(location.name )
                    } label: {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 44, height: 44)
                    }
                }
                
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
