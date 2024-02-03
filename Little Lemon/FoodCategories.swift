//
//  FoodCategories.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.03.
//

import SwiftUI

struct FoodCategories: View {
    var categories = ["Starters", "Desserts", "Drinks", "Specials"]
    var body: some View {
        ScrollView (.horizontal) {
            HStack(spacing: 20.0) {
                ForEach(categories) { category in
                    Text(category)
                        .fixedSize()
                }
            }
            .padding(20.0)
        }
    }
}

#Preview {
    FoodCategories()
}

extension String: Identifiable {

    public var id: String {

        self

    }

}
