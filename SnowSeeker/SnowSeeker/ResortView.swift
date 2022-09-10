//
//  ResortView.swift
//  SnowSeeker
//
//  Created by home on 08/09/22.
//

import SwiftUI

struct ResortView: View {
    let resort: Resort
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    
    @EnvironmentObject var favorites: Favorites
    
    @State private var selectedFacility: Facility?
    @State private var showingFAcility = false
    
    var body: some View {
        ScrollView{
            VStack(alignment:.leading, spacing: 0 ){
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                HStack{
                    if sizeClass == .compact && typeSize > .large {
                        VStack(spacing: 10){ResortDetailView(resort: resort)}
                        VStack(spacing: 10){SkiDetailsView(resort: resort)}
                    }else{
                        ResortDetailView(resort: resort)
                        SkiDetailsView(resort: resort)
                    }
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                
                Group{
                    Text(resort.description)
                        .padding(.vertical)
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    HStack{
                        ForEach(resort.facilityType){ facility in
                            Button{
                                selectedFacility = facility
                                showingFAcility = true
                            } label:{
                                facility.icon
                                    .font(.title)
                            }                            
                        }
                    }
                    
                    Button(favorites.contains(resort) ? "Remove from favorites" : "Add to favorites"){
                        if favorites.contains(resort){
                            favorites.remove(resort)
                        } else {
                            favorites.add(resort)
                        }
                    }
                    .buttonStyle(.borderedProminent )
                    .padding()
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("\(resort.name), \(resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacility?.name ?? "More Information", isPresented: $showingFAcility, presenting: selectedFacility){ _ in
        } message: { facility in
            Text(facility.description)
        }
    }
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ResortView(resort: Resort.example)
        }
        .environmentObject(Favorites())
    }
}
