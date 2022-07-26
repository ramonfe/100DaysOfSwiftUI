//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Ramon Felix on 25/07/22.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchedRequest: FetchedResults<T>
    let content: (T)-> Content
    
    var body: some View {
        List(fetchedRequest, id: \ .self){ item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue:String, @ViewBuilder content: @escaping (T) -> Content){
        _fetchedRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}


