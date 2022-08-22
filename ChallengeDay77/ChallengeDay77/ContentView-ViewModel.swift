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
        @Published private(set) var userImages: [UserImage]
        
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
        func addImage(name: String, img: UIImage){
            let saveImgPath = FileManager.documentsDirectory.appendingPathComponent("\(name).jpg")
            if let jpegData = img.jpegData(compressionQuality: 0.8){
                try? jpegData.write(to: saveImgPath, options: [.atomicWrite ])
            }
            let userImage = UserImage(id: UUID(), name: name, location: saveImgPath.absoluteString)
            userImages.append(userImage)
            save()
        }
    }
}
