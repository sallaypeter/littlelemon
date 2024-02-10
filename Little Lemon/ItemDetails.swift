//
//  ItemDetails.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.03.
//

import SwiftUI

struct ItemDetails: View {
    var title: String
    var description: String
    var price: String
    var image: String
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20.0) {
                    AsyncImage(url: URL(string: image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 200, height: 200)
                    Text(title)
                        .font(Font.custom("Karla-ExtraBold", size: 24))
                        .foregroundStyle(.littleLemonPrimaryGreen)
                    Text(description)
                        .font(Font.custom("Karla-Medium", size: 18))
                        .foregroundStyle(.littleLemonPrimaryGreen)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    Text("$\(price)")
                        .font(Font.custom("Karla-Bold", size: 20))
                        .foregroundStyle(.littleLemonPrimaryGreen)
                }
                .padding(20.0)
            }
        }
        .navigationTitle(title)
    }
}

#Preview {
    ItemDetails(title: "Greek Salad", description: "The famous greek salad of crispy lettuce, peppers, olives, our Chicago.", price: "12.99", image: "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true")
}
