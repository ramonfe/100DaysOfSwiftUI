//
//  ProspectsView.swift
//  Project16
//
//  Created by home on 23/08/22.
//

import SwiftUI

struct ProspectsView: View {
    enum FilterType{
        case none, contacted, uncontacted
    }
    let filter: FilterType
    
    var title: String{
        switch filter{
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case.uncontacted:
            return "Uncontacted people"
        }
    }
    
    var body: some View {
        NavigationView{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
                .navigationTitle(title)
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
