//
//  FileManager-DocDirectory.swift
//  ChallengeDay77
//
//  Created by home on 19/08/22.
//

import Foundation

extension FileManager{
    static var documentsDirectory: URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
