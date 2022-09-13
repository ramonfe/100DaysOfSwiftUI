//
//  FileManager.swift
//  SnowSeeker
//
//  Created by home on 12/09/22.
//

import Foundation

extension FileManager{
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
