//
//  ImgInterpView.swift
//  Day80
//
//  Created by home on 23/08/22.
//

import SwiftUI

struct ImgInterpView: View {
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
    }
}

struct ImgInterpView_Previews: PreviewProvider {
    static var previews: some View {
        ImgInterpView()
    }
}
