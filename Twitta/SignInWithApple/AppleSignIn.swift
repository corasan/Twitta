//
//  AppleSignIn.swift
//  Twitta
//
//  Created by Henry Paulino on 2/21/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct AppleSignIn: View {
    func printThing() {
        print("sigh")
    }
    
    var appleButton = AppleSignInController()
    var delegate = AppleSignInCoordinator()
    
    func showAppleSignIn() -> Void {
        let nonce = delegate.randomNonceString()
        delegate.currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = delegate.sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.presentationContextProvider = delegate
        authorizationController.delegate = delegate
        authorizationController.performRequests()
    }

    var body: some View {
        appleButton
            .frame(width: 200, height: 50)
            .onTapGesture(perform: showAppleSignIn)
    }
}

struct AppleSignIn_Previews: PreviewProvider {
    static var previews: some View {
        AppleSignIn()
    }
}
