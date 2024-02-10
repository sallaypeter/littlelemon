//
//  Playground.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.07.
//

import SwiftUI

struct Playground: View {
    @State private var starterOn = false
    var body: some View {
        Text("Karla")
            .font(Font.custom("Karla-Bold", size: 64))
        Text("MarkaziText")
            .foregroundStyle(.littleLemonPrimaryGreen)
            .background(.littleLemonPrimaryYellow)
            .font(Font.custom("MarkeziText-Regular", size: 60))
        Rectangle()
            .fill(.littleLemonPrimaryGreen)
            .frame(width: 200, height: 30)
        Rectangle()
            .fill(.littleLemonPrimaryYellow)
            .frame(width: 200, height: 30)
        Rectangle()
            .fill(.littleLemonSecondarySalmon)
            .frame(width: 200, height: 30)
        Rectangle()
            .fill(.littleLemonSecondaryPeach)
            .frame(width: 200, height: 30)
        Rectangle()
            .fill(.littleLemonHighlightWhite)
            .frame(width: 200, height: 30)
        Rectangle()
            .fill(.littleLemonHighlightBlack)
            .frame(width: 200, height: 30)
        Toggle("starter", isOn: $starterOn).toggleStyle(MenuBreakdownToggleStyle())
        Toggle("Newsletter", isOn: $starterOn).toggleStyle(CheckmarkToggleStyle())
        Button("Save") { }
            .buttonStyle(GreenButtonStyle())
        Button("Discard") { }
            .buttonStyle(WhiteButtonStyle())
        Button("Logout") { }
            .buttonStyle(YellowButtonStyle())
    }
}

#Preview {
    Playground()
}
