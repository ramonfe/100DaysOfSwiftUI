//
//  ContentView.swift
//  SnowSeeker
//
//  Created by home on 08/09/22.
//

import SwiftUI

extension View{
    @ViewBuilder func phoneOnlyNavigationView() -> some View{
        if UIDevice.current.userInterfaceIdiom == .phone{
            self.navigationViewStyle(.stack)
        }else{
            self
        }
    }
}

enum sorted{
    case none, alphabetical, country
}

struct ContentView: View {
    var resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject var favorites = Favorites()
    @State private var searchText = ""
    @State private var showSort = false
    @State private var sortedBy = sorted.none
    
    var body: some View {
        NavigationView{
            List(filteredResorts){ resort in
                NavigationLink{
                    ResortView(resort: resort)
                }label: {
                    HStack{
                        Image(resort.country)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading){
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs" )
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort){
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("this is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                ToolbarItem{
                    Button{
                        showSort.toggle()
                    }label: {
                        Label("Sort", systemImage: "arrow.up.arrow.down.square")
                    }
                }
            }
            .confirmationDialog("Sort by", isPresented: $showSort) {
                Button("Sort Alphabetical"){
                    sortedBy = .alphabetical
                }
                Button("Sort by Country"){
                    sortedBy = .country
                }
            }
            
            WelcomeView()
        }
        .environmentObject(favorites)
        
    }
    
    var filteredResorts: [Resort]{
        var resortRet: [Resort]
        if searchText.isEmpty{
            resortRet = resorts
        } else{
            resortRet = resorts.filter{ $0.name.localizedCaseInsensitiveContains(searchText) }
        }
        switch sortedBy{
            case .country:
                return resortRet.sorted { lhs, rhs in
                    lhs.country < rhs.country
                }
            case .alphabetical:
                return resortRet.sorted { lhs, rhs in
                    lhs.name < rhs.name
                }
            case .none:
                return resortRet
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
