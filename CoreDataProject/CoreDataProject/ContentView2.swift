//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Ramon Felix on 21/07/22.
//

import CoreData
import SwiftUI



struct ContentView2: View {
    @Environment(\.managedObjectContext)var moc
    @State private var lastNameFilter =  "A"
    private let sortDescArr:[SortDescriptor<Singer>] = [ //SortDescriptor(\.lastName, order: .reverse),
        SortDescriptor(\.firstName, order: .reverse)
    ]
    let filterPar = Predicated.beginsWith
    
    var body: some View {
        VStack{
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter, filterParameter: filterPar, sortDesc: sortDescArr) {(singer:Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Example"){
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            Button("Show A"){
                lastNameFilter = "A"
            }
            Button("Show S"){
                lastNameFilter = "S"
            }
        }
        
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
