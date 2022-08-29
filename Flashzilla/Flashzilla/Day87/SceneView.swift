//
//  SceneView.swift
//  Flashzilla
//
//  Created by home on 25/08/22.
//

import SwiftUI

struct SceneView: View {
    //to know if your app is active or not
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active{
                    print("Active")
                }else if newPhase == .inactive {
                    print ("Inactive")
                }else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

struct SceneView_Previews: PreviewProvider {
    static var previews: some View {
        SceneView()
    }
}
