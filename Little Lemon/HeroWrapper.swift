//
//  HeroWrapper.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.07.
//

import SwiftUI

struct HeroWrapper: View {
    var body: some View {
        VStack(spacing: 0.0) {
            HeroTitle()
            HeroSubTitle()
        }
        .padding(0.0)
    }
}

#Preview {
    HeroWrapper()
}
