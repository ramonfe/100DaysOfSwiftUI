//
//  FileManager.swift
//  Flashzilla
//
//  Created by home on 01/09/22.
//

import Foundation

extension FileManager{
    static var documentDirectory: URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
