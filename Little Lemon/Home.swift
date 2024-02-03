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
            Menu()
                .tabItem { Label("Menu", systemImage: "list.dash") }
                .tag("Menu")
            UserProfile()
                .tabItem { Label("Profile", systemImage: "square.and.pencil") }
                .tag("Profile")
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    Home()
}
