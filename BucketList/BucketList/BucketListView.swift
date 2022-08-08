//
//  BucketListView.swift
//  BucketList
//
//  Created by home on 08/08/22.
//

import SwiftUI

enum LoadinState{
    case loading, success, failed
}

struct LoadingView:View{
    var body: some View{
        Text("Loading..")
    }
}

struct SuccessView:View{
    var body: some View{
        Text("Success!")
    }
}

struct FailedView:View{
    var body: some View{
        Text("Failed.")
    }
}

struct BucketListView: View {
    var loadingState = LoadinState.failed
    
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}

struct BucketListView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListView()
    }
}
