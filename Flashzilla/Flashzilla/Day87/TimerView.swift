//
//  TimerView.swift
//  Flashzilla
//
//  Created by home on 25/08/22.
//

import SwiftUI

struct TimerView: View {
    let timer = Timer.publish(every: 1, tolerance: 0, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                if counter == 5{
                    timer.upstream.connect().cancel()
                }else{
                    print( "time now is \(time)")
                }
                counter += 1
            }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
