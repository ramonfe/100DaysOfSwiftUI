//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by home on 10/08/22.
//

import Foundation


extension EditView{
    enum LoadingState {
        case loading,loaded,failed
    }
    @MainActor class ViewModel:ObservableObject {
        @Published var name:String
        @Published var description:String
        @Published var location: Location
        
        @Published var loadingState = LoadingState.loading
        
        init() { }
    }
}
