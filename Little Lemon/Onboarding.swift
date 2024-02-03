//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.03.
//

import SwiftUI

func validateEmail(email: String) -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    return emailPredicate.evaluate(with: email)
}

func validatePassword(_ password: String) -> Bool {
    let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
    return passwordPredicate.evaluate(with: password)
}

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
                VStack(alignment: .leading) {
                    Text("First Name")
                    TextField("First Name", text: $firstName)
                    Text("Last Name")
                    TextField("Last Name", text: $lastName)
                    Text("Email Name")
                    TextField("Email", text: $email)
                }
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
            }
            // VStack modifiers
            .padding()
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
            }
        }
    }
}

#Preview {
    Onboarding()
}
