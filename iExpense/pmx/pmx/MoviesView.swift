//
//  MoviesView.swift
//  pmx
//
//  Created by home on 19/09/22.
//

import SwiftUI

struct MoviesView: View {
    @State private var pelis = [Peliculas]()
    var tab = ""
    var body: some View {
        NavigationView{
            List(pelis, id: \.id ) { peli in
                Text(peli.title!)
            }
            .navigationTitle("Pelis")
        }
        .task {
            pelis = await NetworkProvider.shared.loadEstrenos()
        }
    }
}
    
    
    struct MoviesView_Previews: PreviewProvider {
        static var previews: some View {
            MoviesView()
        }
    }
