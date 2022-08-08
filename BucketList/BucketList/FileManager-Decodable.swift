//
//  FileManager-Decodable.swift
//  BucketList
//
//  Created by home on 08/08/22.
//

import Foundation

extension FileManager{
    static func readFile(message:String, _ file: String)-> String{
        //guard let str = str else{
            //fatalError("Failed reading string to write/read")
        //}
        let str = "some text"
        guard let urls = try? FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) else {
                fatalError("Failed to locate FileManager")
        }
        let url = urls[0]
       
        guard let url = try? url.appendingPathComponent(file) else {
            fatalError("Failed to locate \(file)")
        }
        
        guard let writed = try? message.write(to: url, atomically: true, encoding: .utf8)else{
            fatalError("failed to read file \(file)")
        }
        guard let readed = try? String(contentsOf: url) else {
            fatalError("Failed to read file \(file)")
        }
        
        return readed
    }
}
