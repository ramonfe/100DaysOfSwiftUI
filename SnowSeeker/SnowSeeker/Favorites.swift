//
//  Favorites.swift
//  SnowSeeker
//
//  Created by home on 09/09/22.
//

import Foundation


class Favorites: ObservableObject{
    private var resorts: Set<String>
    private let saveKey = "Favorites"
    private let pathFile = FileManager.documentDirectory.appendingPathComponent("SavedFavs")
    
    init(){
        //load to save data
        if let savedFavs = UserDefaults.standard.data(forKey: "Favs"){
           
                resorts = Set(savedFavs.map(String.init))
                print("init executed")
            
        }
        
        resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool{
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort){
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort){
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save(){
        let strChain = resorts.joined(separator: ",")
            
        UserDefaults.standard.set(strChain, forKey: "Favs")
//        if let strChain = resorts.joined(separator: ","){
//            UserDefaults.standard.set(strChain, forKey: "Favs")
//        } else{
//            print("not decodified")
//        }
        
    }
}
