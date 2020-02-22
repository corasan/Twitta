//
//  AppleSignInController.swift
//  Twitta
//
//  Created by Henry Paulino on 2/21/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct AppleSignInController: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    var window: UIWindow = UIWindow()
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton()
    }
    
    func updateUIView(_ uiViewController: ASAuthorizationAppleIDButton, context: Context) { }
}
