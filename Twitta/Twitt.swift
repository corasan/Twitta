//
//  Twitt.swift
//  Twitta
//
//  Created by Henry Paulino on 2/15/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct TwittType: Identifiable {
    let id, content: String
}

class Twitt: ObservableObject {
    @Published var data = [TwittType]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("Twitts").addSnapshotListener { (snapshot, err) in
            if err != nil {
                print("Error fetching Twitts: \(err!)")
            }

            for el in (snapshot?.documentChanges)! {
                let doc = el.document.data()
                let newTwitt = TwittType(id: doc["id"] as! String, content: doc["content"] as! String)
                self.data.append(newTwitt)
            }
        }
    }
}

