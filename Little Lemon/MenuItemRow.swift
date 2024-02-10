//
//  MenuItemRow.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.09.
//

import SwiftUI

struct MenuItemRow: View {
    var title: String
    var description: String
    var price: String
    var image: String
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 10.0) {
                Text(title)
                    .font(Font.custom("Karla-ExtraBold", size: 16))
                    .foregroundStyle(.littleLemonPrimaryGreen)
                Text(description)
                    .font(Font.custom("Karla-Regular", size: 14))
                    .foregroundStyle(.littleLemonPrimaryGreen)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Text("$\(price)")
                    .font(Font.custom("Karla-Medium", size: 16))
                    .foregroundStyle(.littleLemonPrimaryGreen)
            }
            Spacer()
            AsyncImage(url: URL(string: image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 75, height: 75)
        }
        .padding(0.0)
    }
}

#Preview {
    MenuItemRow(title: "Greek Salad", description: "The famous greek salad of crispy lettuce, peppers, olives, our Chicago.", price: "12.99", image: "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true")
}
