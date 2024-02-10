//
//  HeroSection.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.07.
//

import SwiftUI

struct HeroSection: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Little Lemon")
                .font(Font.custom("MarkaziText-Medium", size: 64))
                .padding(0)
                .foregroundStyle(.littleLemonPrimaryYellow)
            HStack {
                VStack(alignment: .leading) {
                    Text("Chicago")
                        .font(Font.custom("MarkaziText-Medium", size: 40))
                        .padding(0)
                        .foregroundStyle(.white)
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .font(Font.custom("Karla-Medium", size: 18))
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                //Spacer()
                Image("Hero image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(0.0)
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipShape(Rectangle())
                    .cornerRadius(16)
            }
            .padding(0)
        }
        //.frame(maxWidth: .infinity)
        .padding(20)
        .background(.littleLemonPrimaryGreen)
    }
}

#Preview {
    HeroSection()
}
