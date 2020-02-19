//
//  CreateTwitt.swift
//  Twitta
//
//  Created by Henry Paulino on 2/18/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct CreateTwitt: View {
    @Environment(\.presentationMode) var presentationMode
    @State var twittText: String = ""
    @State var buttonDisabled: Bool = true
    
    private func addTwitt() {
        let db: Firestore = Firestore.firestore()
        let docRef: DocumentReference = db.collection("Twitts").document()
        docRef.setData(["content": self.twittText, "id": docRef.documentID]) { err in
            if let err = err {
                print(err)
            } else {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        print("pressed cancel")
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                            .foregroundColor(Color.blue)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        self.addTwitt()
                    }) {
                        Text("Twitt")
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                            .background(self.twittText.isEmpty ? Color.blue.opacity(0.4) : Color.blue)
                            .cornerRadius(15.0)
                            
                    }
                        .disabled(self.twittText.isEmpty)
                        .padding([.horizontal, .vertical], 5)
                    
                }
                
                TextView(text: self.$twittText, placeholderText: "What's poppin?")
            }
            Spacer()
        }
        .padding()
        .background(Color(red: 0.08, green: 0.13, blue: 0.17, opacity: 1.0).edgesIgnoringSafeArea(.all))
    }
}

struct CreateTwitt_Previews: PreviewProvider {
    static var previews: some View {
        CreateTwitt()
    }
}
