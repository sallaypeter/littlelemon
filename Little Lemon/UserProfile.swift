//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.03.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    @State private var firstName:String = (UserDefaults.standard.string(forKey: kFirstName) ?? "")
    @State private var lastName:String = (UserDefaults.standard.string(forKey: kLastName) ?? "")
    @State private var email:String = (UserDefaults.standard.string(forKey: kEmail) ?? "")
    var body: some View {
        VStack(spacing: 10.0) {
            Text("Personal information")
            Image("profile-image-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200, alignment: .center)
                .border(.black)
            Text(firstName)
            Text(lastName)
            Text(email)
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
