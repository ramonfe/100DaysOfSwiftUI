//
//  UserLocationView.swift
//  BucketList
//
//  Created by Ramon Felix on 08/08/22.
//

import MapKit
import SwiftUI

struct UserLocationView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations){location in
                //MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.latitud, longitude: location.longitud))
                MapAnnotation(coordinate: location.coordinate){
                    VStack{
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(Circle())
                        
                        Text(location.name)
                            .fixedSize()
                    }
                    .onTapGesture {
                        viewModel.selectedPlace = location
                    }
                }
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
                        let newLocation  = Location(id: UUID(), name: "New Location", description: "", latitud: viewModel.mapRegion.center.latitude, longitud: viewModel.mapRegion.center.longitude)
                        viewModel.locations.append(newLocation)
                        
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
        .sheet(item: $viewModel.selectedPlace) { place in
            EditView(location: place) { newLocation in
                if let index = viewModel.locations.firstIndex(of: place){
                    viewModel.locations[index] = newLocation
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
