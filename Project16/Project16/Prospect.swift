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
    var date = Date()
}

@MainActor class Prospects: ObservableObject{
    @Published private(set) var people: [Prospect] = []
    let saveKey = "SavedKey"
    private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedProspects")
    private var sortType = 0
    init() {
//        if let data = UserDefaults.standard.data(forKey: saveKey){
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data){
//                people = decoded
//                return
//            }
//        }
        do{
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Prospect].self, from: data)
        }catch{
            //no saves data
            people = []
        }
    }
    private func save(){
//        if let enconded = try? JSONEncoder().encode(people){
//            UserDefaults.standard.set(enconded, forKey: saveKey)
//        }
        do{
            let data = try JSONEncoder().encode(people)
            try data.write(to: savePath, options: .atomic)
        }catch{
            print("unable to save data")
        }
    }
    func add(_ prospect: Prospect){
        people.append(prospect)
        save()
        sort(sortType)
    }
    func toogle(_ prospect: Prospect){
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    func sort(_ sortType: Int){
        self.sortType = sortType
        if sortType == 1{
            people.sort { lhs, rhs in lhs.name < rhs.name}
        }else{
            people.sort { lhs, rhs in lhs.date > rhs.date}
        }
    }
}
