//
//  PkgDependency.swift
//  Day81
//
//  Created by home on 23/08/22.
//

import SamplePackage
import SwiftUI

struct PkgDependency: View {
    let posibleNumbers = Array(1...60)
    
    var body: some View {
        Text(results)
            .padding()
    }
    
    var results: String{
        let selected = posibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        
        return strings.joined(separator: ", ")
    }
}

struct PkgDependency_Previews: PreviewProvider {
    static var previews: some View {
        PkgDependency()
    }
}
