//
//  Facility.swift
//  SnowSeeker
//
//  Created by home on 09/09/22.
//

import SwiftUI

struct Facility: Identifiable{
    let id = UUID()
    let name:String
    private let icons = [
        "Accommodation":"house",
        "Beginners":"1.circle",
        "Cross-country":"map",
        "Eco-friendly":"leaf.arrow.circlepath",
        "Family":"person.3"
    ]
    
    private let descriptions = [
        "Accommodation":"This resort is popular on-site accommodations.",
        "Beginners":"This resort has a lot of ski schools.",
        "Cross-country":"This resort has many cross-country ski routes.",
        "Eco-friendly":"This resort has won an award for environmental friendliness.",
        "Family":"This resort is popular with families."
    ]
    
    var icon: some View{
        if let iconName = icons[name]{
            return Image(systemName: iconName)
                .accessibilityLabel(name)
                .foregroundColor(.secondary)
        }else{
            fatalError("uknows facility type \(name)")
        }
    }
    
    var description: String{
        if let message = descriptions[name]{
            return message
        }else{
            fatalError("uknows facility type \(name)")
        }
    }
}
