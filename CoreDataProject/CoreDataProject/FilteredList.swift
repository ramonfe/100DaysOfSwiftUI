//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Ramon Felix on 25/07/22.
//

import CoreData
import SwiftUI

enum Predicated: String {
    case beginsWith = "%K BEGINSWITH %@"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchedRequest: FetchedResults<T>
    let content: (T)-> Content
    
    var body: some View {
        List(fetchedRequest, id: \ .self){ item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue:String, filterParameter: Predicated,sortDesc:[SortDescriptor<T>], @ViewBuilder content: @escaping (T) -> Content){
        _fetchedRequest = FetchRequest<T>(sortDescriptors: sortDesc, predicate: NSPredicate(format: filterParameter.rawValue, filterKey, filterValue))
        self.content = content
    }
}


