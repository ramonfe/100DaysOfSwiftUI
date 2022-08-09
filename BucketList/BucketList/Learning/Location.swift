//
//  Location.swift
//  BucketList
//
//  Created by Ramon Felix on 08/08/22.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Codable, Equatable{
    var id: UUID
    var name: String
    var description:String
    let latitud:Double
    let longitud: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
    }
    
    static let exmaple = Location(id: UUID(), name: "Buckin placa", description: "donde vice la reina con sus perrijos", latitud: 51.501, longitud: -0.141)
    
    static func ==(lhs: Location, rhs: Location) -> Bool{
        lhs.id == rhs.id
    }
}
