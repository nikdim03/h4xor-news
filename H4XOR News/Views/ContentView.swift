//
//  ContentView.swift
//  H4XOR News
//
//  Created by Dmitriy on 3/28/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink {
                    DetailView(url: post.url)
                } label: {
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4XOR NEWS")
        }
        .onAppear(perform: networkManager.fetchData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
