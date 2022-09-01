//
//  DataManager.swift
//  Flashzilla
//
//  Created by home on 01/09/22.
//

import Foundation

struct DataManager{
    static let savePath = FileManager.documentDirectory.appendingPathComponent("SaveData")
    
    static func load() -> [Card]{
        
        if let data = try? Data(contentsOf: savePath){
            if let decoded = try? JSONDecoder().decode([Card].self, from: data){
                return decoded
            }
        }
        return []
    }
    
    static func save(_ cards: [Card]){
        
        if let encoded = try? JSONEncoder().encode(cards){
            try? encoded.write(to: savePath, options: [.atomic])
        }
        
    }
}
