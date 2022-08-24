//
//  Prospect.swift
//  Project16
//
//  Created by Ramon Felix on 23/08/22.
//

import SwiftUI

class Prospect: Identifiable, Codable{
    var id = UUID()
    var name = "Anonymus"
    var emailAddress = ""
    var isContacted = false
}

@MainActor class Prospects: ObservableObject{
    @Published var people: [Prospect] = []
    
    init() {
        people = []
    }
}
