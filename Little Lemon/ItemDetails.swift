//
//  ItemDetails.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.03.
//

import SwiftUI

struct ItemDetails: View {
    var title: String
    var price: String
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Price:")
                        .fontWeight(.bold)
                    Text("$\(price)")
                }
                .padding(1)
            }
        }
        .navigationTitle(title)
    }
}

#Preview {
    ItemDetails(title: "Hamburger", price: "12.99")
}
