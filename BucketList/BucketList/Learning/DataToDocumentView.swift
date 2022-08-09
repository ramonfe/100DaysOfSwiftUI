//
//  DataToDocumentView.swift
//  BucketList
//
//  Created by home on 08/08/22.
//

import SwiftUI

struct DataToDocumentView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                print(FileManager.readFile(message: "my message", "some.txt"))
                
//                let str = "Test Message"
//                let url = getDocumentDirectory().appendingPathComponent("message.txt")
//
//                do{
//                    try str.write(to: url, atomically: true, encoding: .utf8)
//                    let input = try String(contentsOf: url)
//                    print(input)
//                } catch{
//                    print(error.localizedDescription)
//                }
            }
    }
    
    //get our app directory
    func getDocumentDirectory()-> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct DataToDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        DataToDocumentView()
    }
}
