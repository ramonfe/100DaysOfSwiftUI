//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Ramon Felix on 16/07/22.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext , dataController.container.viewContext)
        }
    }
}
