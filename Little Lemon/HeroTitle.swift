//
//  HeroTitle.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.07.
//

import SwiftUI

struct HeroTitle: View {
    var body: some View {
        HStack(alignment: .center) {
            Text("Little Lemon")
                .font(Font.custom("MarkaziText-Medium", size: 64))
                .foregroundStyle(.littleLemonPrimaryYellow)
            Spacer()
        }
        .padding([.leading, .trailing], 10)
        .background(.littleLemonPrimaryGreen)
    }
}

#Preview {
    HeroTitle()
}
