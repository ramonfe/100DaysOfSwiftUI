//
//  EditView.swift
//  BucketList
//
//  Created by home on 09/08/22.
//

import SwiftUI

struct EditView: View {
    @StateObject private var viewModel = ViewModel()
    
    @Environment(\.dismiss ) var dismiss
    var onSave: (Location) -> Void
    
    //var location:Location
    
    @State private var pages = [Page]()
    
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
                        ForEach(pages, id: \.pageid ){ page in
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
                    var newLocation = viewModel.location
                    newLocation.id = UUID()
                    newLocation.name = viewModel.name
                    newLocation.description = viewModel.description
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await fetchNearbyPlaces()
            }
        }
    }
    init(location:Location, onSave: @escaping (Location) -> Void ) {
        self.location = location
        self.onSave = onSave
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
    
    func fetchNearbyPlaces() async{
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(viewModel.location.coordinate.latitude)%7C\(viewModel.location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        
        guard let url = URL(string: urlString) else{
            print("bard url")
            return
        }
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            pages = items.query.pages.values.sorted()
            viewModel.loadingState = .loaded
        }catch{
            viewModel.loadingState = .failed
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: Location.example){_ in }
    }
}
