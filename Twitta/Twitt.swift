//
//  Twitt.swift
//  Twitta
//
//  Created by Henry Paulino on 2/15/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import Foundation
import FirebaseFirestore

class Twitt {
    static func subscribe() {
        let db = Firestore.firestore()
        db.collection("Twitt").addSnapshotListener { (snapshot, err) in
            if err != nil {
                print("Error fetching Twitts: \(err!)")
            }
            
            for el in (snapshot?.documentChanges)! {
                print("Data: \(el.document.data())")
            }
        }
    }
}

