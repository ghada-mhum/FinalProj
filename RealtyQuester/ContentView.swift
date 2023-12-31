//
//  ContentView.swift
//  RealtyQuester
//
//  Created by ghada Mohammad on 15/06/1445 AH.
//

import SwiftUI

struct ContentView: View {
    init() {
            UITabBar.appearance().backgroundColor = UIColor.white
        }
    var body: some View {
        TabView{
            HomeView()
                .tabItem { Image(systemName: "house")
                  
                    Text("Home")
                }
           
            FavoratitesView()
                .tabItem { Image(systemName: "heart")
                    Text("Favorite")
                }
            MessagesView()
                .tabItem { Image(systemName: "bubble.left.and.bubble.right.fill")
                    Text("Messages")
                }
            ProfileView()
                .tabItem { Image(systemName: "person")
                    Text("Profile")
                }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
