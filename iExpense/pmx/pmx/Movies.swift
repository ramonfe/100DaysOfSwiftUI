//
//  Movies.swift
//  pmx
//
//  Created by home on 19/09/22.
//

import Foundation

struct Peliculas:Codable,Identifiable {
    var id:UUID = UUID()
    var title:String?
    var image:String?
    var critics_score:String?
    var mxTheaterReleaseDate:String?
    var synopsis:String?
    var genre:[String]?
    var actor:[String]?
    var director:[String]?
    var idImdb:String?=nil
    var backdrop_path:String?
    var posterPath:String?
    var trailerKey:String?
}
