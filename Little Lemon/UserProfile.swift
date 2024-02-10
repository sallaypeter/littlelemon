//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.03.
//

import SwiftUI

struct UserProfile: View {
    @Binding var selectedTab: String
    @Environment(\.presentationMode) var presentation
    @State private var firstName:String = (UserDefaults.standard.string(forKey: kFirstName) ?? "")
    @State private var lastName:String = (UserDefaults.standard.string(forKey: kLastName) ?? "")
    @State private var email:String = (UserDefaults.standard.string(forKey: kEmail) ?? "")
    @State private var phoneNumber:String = (UserDefaults.standard.string(forKey: kPhoneNumber) ?? "")
    @State private var orderStatuses = UserDefaults.standard.bool(forKey: kOrderStatuses)
    @State private var passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
    @State private var specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
    @State private var newletters = UserDefaults.standard.bool(forKey: kNewsletter)
    @State private var showEmptyFieldAlert:Bool = false
    @State private var showInvalidEmailAlert: Bool = false
    var body: some View {
        VStack(alignment: .leading) {
            // Header
            HStack(alignment: .center) {
                Button {
                    selectedTab = "Menu"
                } label: {
                    Image(systemName: "arrow.backward.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle( Color.littleLemonPrimaryGreen)
                }
                .padding([.bottom,.leading], 10)
                Spacer()
                Image("Logo")
                    .padding([.bottom], 10)
                Spacer()
                Button {
                    selectedTab = "Profile"
                } label: {
                    Image("Profile")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding([.bottom,.trailing], 10)
            }
            ScrollView {
                // Info
                HStack {
                    Text("Personal information")
                        .font(Font.custom("Karla-ExtraBold", size: 16))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.littleLemonPrimaryGreen)
                    Spacer()
                }
                // Avatar
                HStack {
                    Text("Avatar")
                        .font(Font.custom("Karla-Bold", size: 10))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.gray)
                    Spacer()
                }
                .padding(.top, 5.0)
                .padding(.bottom, 0.0)
                HStack(alignment: .center) {
                    Image("profile-image-placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75, height: 75, alignment: .center)
                    Button("Change") { }.buttonStyle(GreenButtonStyle())
                    Button("Remove") { }.buttonStyle(WhiteButtonStyle())
                    Spacer()
                }
                .padding(.top, 10)
                // First Name
                HStack {
                    Text("First name")
                        .font(Font.custom("Karla-Bold", size: 10))
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
                        .font(Font.custom("Karla-Bold", size: 10))
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
                        .font(Font.custom("Karla-Bold", size: 10))
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
                // Phone Number
                HStack {
                    Text("Phone number")
                        .font(Font.custom("Karla-Bold", size: 10))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.gray)
                    Spacer()
                }
                .padding(.top, 5.0)
                .padding(.bottom, 0.0)
                TextField("Phone Number", text: $phoneNumber)
                    .textFieldStyle(.roundedBorder)
                    .font(Font.custom("Karla-Bold", size: 14))
                    .foregroundColor(.littleLemonPrimaryGreen)
                // Notifications
                HStack {
                    Text("Email notifications")
                        .font(Font.custom("Karla-ExtraBold", size: 16))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.littleLemonPrimaryGreen)
                        .padding(.top, 10)
                    Spacer()
                }
                HStack {
                    Toggle("Order statuses", isOn: $orderStatuses).toggleStyle(CheckmarkToggleStyle())
                    Spacer()
                }
                .padding([.top], 2)
                HStack {
                    Toggle("Password changes", isOn: $passwordChanges).toggleStyle(CheckmarkToggleStyle())
                    Spacer()
                }
                .padding([.top], 2)
                HStack {
                    Toggle("Special offers", isOn: $specialOffers).toggleStyle(CheckmarkToggleStyle())
                    Spacer()
                }
                .padding([.top], 2)
                HStack {
                    Toggle("Newsletter", isOn: $newletters).toggleStyle(CheckmarkToggleStyle())
                    Spacer()
                }
                .padding([.top], 2)
                // Logout
                Button("Logout") {
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    UserDefaults.standard.set("", forKey: kFirstName)
                    UserDefaults.standard.set("", forKey: kLastName)
                    UserDefaults.standard.set("", forKey: kEmail)
                    UserDefaults.standard.set("", forKey: kPhoneNumber)
                    UserDefaults.standard.set(false, forKey: kOrderStatuses)
                    UserDefaults.standard.set(false, forKey: kPasswordChanges)
                    UserDefaults.standard.set(false, forKey: kSpecialOffers)
                    UserDefaults.standard.set(false, forKey: kNewsletter)
                    self.presentation.wrappedValue.dismiss()
                }
                .buttonStyle(YellowButtonStyle())
                HStack {
                    // Discard Changes
                    Button("Discard changes") { selectedTab = "Menu" }
                        .buttonStyle(WhiteButtonStyle())
                    Button("Save Changes") {
                        if (!firstName.isEmpty && !lastName.isEmpty && !email.isEmpty) {
                            if (validateEmail(email: email)) {
                                UserDefaults.standard.set(firstName, forKey: kFirstName)
                                UserDefaults.standard.set(lastName, forKey: kLastName)
                                UserDefaults.standard.set(email, forKey: kEmail)
                                UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                                UserDefaults.standard.set(orderStatuses, forKey: kOrderStatuses)
                                UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
                                UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
                                UserDefaults.standard.set(newletters, forKey: kNewsletter)
                                selectedTab = "Menu"
                            } else {
                                showInvalidEmailAlert = true
                            }
                        } else {
                            showEmptyFieldAlert = true
                        }
                    }
                    .buttonStyle(GreenButtonStyle())
                }
            }
        }
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
        .padding(10.0)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    UserProfile(selectedTab: .constant(""))
}
