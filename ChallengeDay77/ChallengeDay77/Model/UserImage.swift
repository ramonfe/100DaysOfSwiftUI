//
//  UserImage.swift
//  ChallengeDay77
//
//  Created by home on 19/08/22.
//

import Foundation
import CoreLocation

struct UserImage:Identifiable, Codable, Comparable{
    var id: UUID
    var name: String
    var location: String
    let latitud: Double
    let longitud: Double
    
    var coordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitud, longitude: longitud)        
    }
    
    static let example = UserImage(id: UUID(), name: "Playa", location: "spongebob.jpg", latitud: 32.525, longitud: -117.03)
    
    static func < (lhs: UserImage, rhs: UserImage) -> Bool {
        lhs.name < rhs.name
    }
}
