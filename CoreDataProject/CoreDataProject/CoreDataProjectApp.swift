//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Ramon Felix on 21/07/22.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView2()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
