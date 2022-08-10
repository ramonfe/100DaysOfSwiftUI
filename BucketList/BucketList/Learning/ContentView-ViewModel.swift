//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by home on 09/08/22.
//

import Foundation
import MapKit


extension UserLocationView{
    @MainActor class ViewModel: ObservableObject{
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        @Published var locations = [Location]()
        
        @Published var selectedPlace: Location?
    }
}
 
