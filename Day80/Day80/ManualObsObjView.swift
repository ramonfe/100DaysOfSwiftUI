//
//  ManualObsObjView.swift
//  Day79
//
//  Created by home on 23/08/22.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject{
    var value = 0{
        willSet{
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10{
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)){
                self.value += 1
            }
        }
    }
}

struct ManualObsObjView: View {
    @StateObject private var updater = DelayedUpdater()
     
    var body: some View {
        Text("Value \(updater.value)")
    }
}

struct ManualObsObjView_Previews: PreviewProvider {
    static var previews: some View {
        ManualObsObjView()
    }
}
