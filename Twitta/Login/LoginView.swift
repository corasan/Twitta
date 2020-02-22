//
//  Login.swift
//  Twitta
//
//  Created by Henry Paulino on 2/20/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import CryptoKit
import AuthenticationServices

struct LoginView: View {
    @State private var user = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Group {
                Spacer()
                HStack {
                    Spacer()
                }
            }

            Group {
                Text("Twitta")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Spacer()

                AppleSignIn()
                Spacer()
            }
        }
        .background(Color(red: 0.08, green: 0.13, blue: 0.17, opacity: 1.0).edgesIgnoringSafeArea(.all))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
