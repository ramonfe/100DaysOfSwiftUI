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
    fileprivate (set)var isContacted = false
}

@MainActor class Prospects: ObservableObject{
    @Published private(set) var people: [Prospect] = []
    let saveKey = "SavedKey"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey){
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data){
                people = decoded
                return
            }
        }
        //no saves data
        people = []
    }
    private func save(){
        if let enconded = try? JSONEncoder().encode(people){
            UserDefaults.standard.set(enconded, forKey: saveKey)
        }
    }
    func add(_ prospect: Prospect){
        people.append(prospect)
        save()
    }
    func toogle(_ prospect: Prospect){
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}
