//
//  FoodCategories.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.03.
//

import SwiftUI

struct MenuBreakdown: View {
    @Binding var startersOn: Bool
    @Binding var mainsOn: Bool
    @Binding var dessertsOn: Bool
    @Binding var drinksOn: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Text("ORDER FOR DELIVERY!")
                .padding([.bottom], 10)
                .font(Font.custom("Karla-ExtraBold", size: 20))
            ScrollView (.horizontal) {
                HStack(spacing: 30.0) {
                    Toggle("Starters", isOn: $startersOn)
                    Toggle("Mains", isOn: $mainsOn)
                    Toggle("Desserts", isOn: $dessertsOn)
                    Toggle("Drinks", isOn: $drinksOn)
                }
                .toggleStyle(MenuBreakdownToggleStyle())
                .font(Font.custom("Karla-ExtraBold", size: 14))
            }
        }
        .padding([.leading, .trailing, .bottom], 10)
        
    }
}

#Preview {
    MenuBreakdown(
        startersOn: .constant(true),
        mainsOn: .constant(true),
        dessertsOn: .constant(true),
        drinksOn: .constant(true)
    )
}

extension String: Identifiable {
    public var id: String {
        self
    }
}
