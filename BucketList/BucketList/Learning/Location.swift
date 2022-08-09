//
//  Location.swift
//  BucketList
//
//  Created by Ramon Felix on 08/08/22.
//

import Foundation


struct Location: Identifiable, Codable, Equatable{
    let id: UUID
    var name: String
    var description:String
    let latitud:Double
    let longitud: Double
}
