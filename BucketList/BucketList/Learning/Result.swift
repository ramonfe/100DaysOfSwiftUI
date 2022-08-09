//
//  Result.swift
//  BucketList
//
//  Created by home on 09/08/22.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query:Codable {
    let pages:[Int: Page]
}

struct Page:Codable {
    let pageid:Int
    let title:String
    let terms: [String: [String]]?
}
