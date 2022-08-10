//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by home on 09/08/22.
//

import Foundation
import LocalAuthentication
import MapKit


extension UserLocationView{
    @MainActor class ViewModel: ObservableObject{
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        @Published private(set)  var locations: [Location]
        @Published var selectedPlace: Location?
        @Published var isUnlocked = false
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
        
        init() {
            do{
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            }catch{
                locations = []
            }
        }
        
        func save(){
            do{
                let data =  try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            }catch{
                print("unable to save data")
            }
        }
        
        func addLocation(){
            let newLocation  = Location(id: UUID(), name: "New Location", description: "", latitud: mapRegion.center.latitude, longitud: mapRegion.center.longitude)
            locations.append(newLocation)
            save()
        }
        
        func authenticate(){
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
                let reason = "Please authenticate yourself to unlock you places."
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    if success{
                        Task {
                            @MainActor in
                            self.isUnlocked = true
                        }
                    }else{
                        //error
                    }
                }
            }else{
                //other error
            }
        }
        
        func update(location: Location){
            guard let selectedPlace = selectedPlace else { return }

            if let index = locations.firstIndex(of: selectedPlace){
                locations[index] = location
                save()
            }
        }
    }
}
