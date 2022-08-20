//
//  ContentView-ViewModel.swift
//  ChallengeDay77
//
//  Created by home on 19/08/22.
//

import Foundation
import UIKit

extension ContentView{
    @MainActor class ViewModel: ObservableObject{
        @Published private var userImages = [UserImage]()
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedImages")
        
        init(){
            do{
                let data = try Data(contentsOf: savePath)
                userImages = try JSONDecoder().decode([UserImage].self, from: data)
            }catch{
                userImages = []
            }
        }
        
        func save(){
            do{
                let data = try JSONEncoder().encode(userImages)
                try data.write(to: savePath, options: .atomicWrite )
            }catch{
                print("unable to save data")
            }
        }
    }
}
