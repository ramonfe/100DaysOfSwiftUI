//
//  Bundle-Decodable.swift
//  SnowSeeker
//
//  Created by home on 08/09/22.
//

import Foundation

extension Bundle{
    func decode<T: Decodable>(_ file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("fail to locate that \(file) in bundle")
        }
        guard let data =  try? Data(contentsOf: url) else {
            fatalError("fail to locate that \(file) in bundle")
        }
        
        guard let loaded = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("fail to decode that \(file) in bundle")
        }
        return loaded
    }
    
}
