//
//  HeroSubTitle.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.07.
//

import SwiftUI

struct HeroSubTitle: View {
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Chicago")
                    .font(Font.custom("MarkaziText-Medium", size: 40))
                    .padding(0)
                    .foregroundStyle(.white)
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .font(Font.custom("Karla-Medium", size: 18))
                    .foregroundStyle(.white)
            }
            .padding(0.0)
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            VStack {
                Image("Hero image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(0)
                    .frame(width: 110, height: 110, alignment: .center)
                    .clipShape(Rectangle())
                    .cornerRadius(16)
            }
            .padding([.top], 10)
        }
        .padding([.leading, .bottom, .trailing], 10.0)
        .background(.littleLemonPrimaryGreen)
    }
}

#Preview {
    HeroSubTitle()
}
