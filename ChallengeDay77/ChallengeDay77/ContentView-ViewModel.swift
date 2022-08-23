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
        let locationFetcher = LocationFetcher()
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedImages")
        
        init(){
            do{
                locationFetcher.start()
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
            guard let userLocation =  locationFetcher.lastKnownLocation else {return}
                           
            let saveImgPath = FileManager.documentsDirectory.appendingPathComponent("\(name).jpg")
            if let jpegData = img.jpegData(compressionQuality: 0.8){
                try? jpegData.write(to: saveImgPath, options: [.atomicWrite ])
            }
            print("yiour user location is \(userLocation)")
            let userImage = UserImage(id: UUID(), name: name, location: saveImgPath.absoluteString, latitud: userLocation.latitude, longitud: userLocation.longitude)
            userImages.append(userImage)
            save()
        }
    }
}
