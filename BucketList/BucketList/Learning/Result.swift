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

struct Page:Codable, Comparable {
    let pageid:Int
    let title:String
    let terms: [String: [String]]?
    
    var desciption: String{
        terms?["description"]?.first ?? "No further description"
    }
    
    static func < (lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
}
