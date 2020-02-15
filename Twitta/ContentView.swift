//
//  ContentView.swift
//  Twitta
//
//  Created by Henry Paulino on 2/15/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct Tweet {
    var content: String?
}

struct ContentView: View {
    init() {
        Twitt.subscribe()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Article Title")
                .font(.title)
            HStack {
                Text("By Henry Paulino")
                    .font(.subheadline)
                Spacer()
                Text("2/14/20")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
