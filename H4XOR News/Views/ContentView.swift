//
//  ContentView.swift
//  H4XOR News
//
//  Created by Deepak Rout on 6/24/20.
//  Copyright © 2020 Deepak Rout. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var netwrokManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(netwrokManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
            }.navigationBarTitle("H4X0R News")
        }.onAppear {
            self.netwrokManager.fetchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



