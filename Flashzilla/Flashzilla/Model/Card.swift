//
//  Card.swift
//  Flashzilla
//
//  Created by home on 29/08/22.
//

import Foundation

struct Card: Codable, Identifiable , Equatable{
    var id = UUID()
    let prompt: String
    let answer: String
    
    static let example =  Card(prompt: "Quien era el hijo en la obeja negra", answer: "Pedro Infante")
}

