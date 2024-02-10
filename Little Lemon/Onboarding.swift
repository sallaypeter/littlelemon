//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.03.
//

import SwiftUI

struct Onboarding: View {
    @State private var isLoggedIn:Bool = UserDefaults.standard.bool(forKey: kIsLoggedIn)
    @State private var firstName:String = (UserDefaults.standard.string(forKey: kFirstName) ?? "")
    @State private var lastName:String = (UserDefaults.standard.string(forKey: kLastName) ?? "")
    @State private var email:String = (UserDefaults.standard.string(forKey: kEmail) ?? "")
    @State private var showEmptyFieldAlert:Bool = false
    @State private var showInvalidEmailAlert: Bool = false
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                Image("Logo")
                    .padding([.bottom], 10)
                HeroWrapper()
                VStack(alignment: .leading) {
                    // First Name
                    HStack {
                        Text("First name")
                            .font(Font.custom("Karla-Bold", size: 12))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    .padding(.top, 5.0)
                    .padding(.bottom, 0.0)
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(.roundedBorder)
                        .font(Font.custom("Karla-Bold", size: 14))
                        .foregroundColor(.littleLemonPrimaryGreen)
                        .padding(.top, 0)
                    // Last Name
                    HStack {
                        Text("Last name")
                            .font(Font.custom("Karla-Bold", size: 12))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    .padding(.top, 5.0)
                    .padding(.bottom, 0.0)
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(.roundedBorder)
                        .font(Font.custom("Karla-Bold", size: 14))
                        .foregroundColor(.littleLemonPrimaryGreen)
                        .padding(.top, 0)
                    // Email
                    HStack {
                        Text("Email")
                            .font(Font.custom("Karla-Bold", size: 12))
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    .padding(.top, 5.0)
                    .padding(.bottom, 0.0)
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .font(Font.custom("Karla-Bold", size: 14))
                        .foregroundColor(.littleLemonPrimaryGreen)
                        .keyboardType(.emailAddress)
                        .padding(.top, 0)

                }
                .padding(10.0)
                Button("Register") {
                    if (!firstName.isEmpty && !lastName.isEmpty && !email.isEmpty) {
                        if (validateEmail(email: email)) {
                            UserDefaults.standard.set(firstName, forKey: kFirstName)
                            UserDefaults.standard.set(lastName, forKey: kLastName)
                            UserDefaults.standard.set(email, forKey: kEmail)
                            isLoggedIn = true
                            UserDefaults.standard.set(isLoggedIn, forKey: kIsLoggedIn)
                        } else {
                            showInvalidEmailAlert = true
                        }
                    } else {
                        showEmptyFieldAlert = true
                    }
                }
                .buttonStyle(YellowButtonStyle())
                Spacer()
            }
            // VStack modifiers
            .padding(0.0)
            .alert("Invalid Form Data", isPresented: $showEmptyFieldAlert) {
                Button("OK") {}
            } message: {
                Text("Fields cannot be empty!")
            }
            .alert("Invalid Form Data", isPresented: $showInvalidEmailAlert) {
                Button("OK") {}
            } message: {
                Text("Invalid email address!")
            }
            .onAppear() {
                if (UserDefaults.standard.bool(forKey: kIsLoggedIn)) {
                    isLoggedIn = true
                }
                firstName = (UserDefaults.standard.string(forKey: kFirstName) ?? "")
                lastName = (UserDefaults.standard.string(forKey: kLastName) ?? "")
                email = (UserDefaults.standard.string(forKey: kEmail) ?? "")
            }
        }
    }
}

#Preview {
    Onboarding()
}
