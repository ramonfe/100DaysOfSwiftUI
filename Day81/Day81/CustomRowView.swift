//
//  CustomRowView.swift
//  Day81
//
//  Created by home on 23/08/22.
//

import SwiftUI

struct CustomRowView: View {
    var body: some View {
        List{
            Text("Molotov")
                .swipeActions {
                    Button(role: .destructive){
                        print("Deleting")
                    }label: {
                        Label("Delete", systemImage: "min.circle")
                    }
                }
                .swipeActions(edge: .leading){
                    Button{
                        print("pinning")
                    }label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct CustomRowView_Previews: PreviewProvider {
    static var previews: some View {
        CustomRowView()
    }
}
