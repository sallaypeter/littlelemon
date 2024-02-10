//
//  HomeHeader.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.08.
//

import SwiftUI

struct HomeHeader: View {
    var body: some View {
        HStack(alignment: .center) {
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundStyle(.white)
                .padding([.leading], 20)
            Spacer()
            Image("Logo")
                .padding([.bottom], 20)
            Spacer()
            Button {
                print("profile clicked")
            } label: {
                Image("Profile")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding([.bottom,.trailing], 20)
        }
        .background(.white)
    }
}

#Preview {
    HomeHeader()
}
