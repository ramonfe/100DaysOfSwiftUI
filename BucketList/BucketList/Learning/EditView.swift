//
//  EditView.swift
//  BucketList
//
//  Created by home on 09/08/22.
//

import SwiftUI

struct EditView: View {
    @StateObject private var viewModel: ViewModel
    @Environment(\.dismiss ) var dismiss
    var onSave: (Location) -> Void
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Place Name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                Section("Nearby"){
                    switch viewModel.loadingState {
                    case .loading:
                        Text("Loading..")
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid ){ page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ")
                            + Text(page.desciption )
                                .italic()
                        }
                    case .failed:
                        Text("Please tray again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save"){
                    let newLocation = viewModel.createNewLocation()
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
    init(location:Location, onSave: @escaping (Location) -> Void ) {
        self.onSave = onSave
        
        _viewModel = StateObject(wrappedValue: ViewModel(location: location))
                
        //before migration to mvvm
//        _name = State(initialValue: location.name)
//        _description = State(initialValue: location.description)
    }
    
    
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: Location.example){_ in }
    }
}
