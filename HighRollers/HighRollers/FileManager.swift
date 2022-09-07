//
//  FileManager.swift
//  HighRollers
//
//  Created by home on 07/09/22.
//

import Foundation

extension FileManager{
    static var documentDirectory: URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
}
