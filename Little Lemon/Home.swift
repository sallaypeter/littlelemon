//
//  Home.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.03.
//

import SwiftUI

struct Home: View {
    @State private var selectedTab:String = "Menu"
    var body: some View {
        // to change the tab programatically just change the selectedTab to the tag
        TabView(selection: $selectedTab) {
            Menu(selectedTab: $selectedTab)
                //.tabItem { Label("Menu", systemImage: "list.dash") }
                .tag("Menu")
            UserProfile(selectedTab: $selectedTab)
                //.tabItem { Label("Profile", systemImage: "square.and.pencil") }
                .tag("Profile")
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
