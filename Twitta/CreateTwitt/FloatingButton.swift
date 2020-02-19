//
//  FloatingButton.swift
//  Twitta
//
//  Created by Henry Paulino on 2/18/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct FloatingButton: View {
    @State var showModal: Bool = false

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.showModal = true
                    }) {
                        Text("+")
                            .font(.system(.largeTitle))
                            .foregroundColor(Color.white)
                            .frame(width: 52, height: 45)
                            .padding(.bottom, 7)
                            .background(Color.blue)
                            .cornerRadius(40.0)
                    }
                        .padding(.trailing, 20)
                        .shadow(color: Color.black.opacity(0.8), radius: 4, x: 0, y: 1)
                        .sheet(isPresented: self.$showModal) {
                            CreateTwitt()
                        }
                }
            }
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton()
    }
}
