//
//  ContentView.swift
//  Twitta
//
//  Created by Henry Paulino on 2/15/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    @EnvironmentObject var twitts: Twitt
    @State var show = true
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(red:0.08, green:0.13, blue:0.17, alpha:1.0)
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = UIColor(red:0.08, green:0.13, blue:0.17, alpha:1.0)
        UITableViewCell.appearance().backgroundColor = UIColor(red:0.08, green:0.13, blue:0.17, alpha:1.0)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List(self.twitts.data) { el in
                    TwittCell(content: el.content)
                }
                .navigationBarTitle("Twitts")
                .foregroundColor(.white)
                
                FloatingButton()
            }
        }
    }
}

struct TwittCell: View {
    @State var content: String!

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Henry")
                    .fontWeight(.heavy)
                Text("@corasan")
                    .foregroundColor(.gray)
                Text("• 6h")
                    .foregroundColor(.gray)
            }
            Spacer(minLength: 10)
            Text(content)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Twitt())
    }
}
