//
//  FaceIdView.swift
//  BucketList
//
//  Created by Ramon Felix on 08/08/22.
//

import LocalAuthentication
import SwiftUI

struct FaceIdView: View {
    @State private var isUnlocked = false
    var body: some View {
        VStack{
            if isUnlocked{
                Text("Unlocked")
            }else{
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate(){
        let context = LAContext()
        var error: NSError?
        
        //check biometrics
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            //its possible, so go ahead and use it
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                //authetication has now completed
                if success{
                    isUnlocked=true
                }else{
                    //there was a problem
                }
            }
        }else{
            //no biometrics
        }
    }
}

struct FaceIdView_Previews: PreviewProvider {
    static var previews: some View {
        FaceIdView()
    }
}
