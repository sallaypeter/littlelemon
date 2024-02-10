//
//  LittleLemonUIStyles.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.03.
//

import SwiftUI

struct CheckmarkToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundStyle(configuration.isOn ? Color.littleLemonPrimaryGreen : .secondary)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
        .font(Font.custom("Karla-Regular", size: 16))
    }
}

struct MenuBreakdownToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
            }
        }
        .foregroundStyle(.littleLemonPrimaryGreen)
        .padding(10)
        .background { configuration.isOn ? Color.littleLemonHighlightWhite : Color.white }
        .cornerRadius(12)
    }
}

struct YellowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .white : .black)
            .padding(10)
            .background(configuration.isPressed ? Color.littleLemonPrimaryGreen : Color.littleLemonPrimaryYellow)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct GreenButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.littleLemonPrimaryGreen : .white)
            .padding(10)
            .background(configuration.isPressed ? .white : Color.littleLemonPrimaryGreen)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.littleLemonPrimaryGreen, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct WhiteButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .white : Color.littleLemonPrimaryGreen)
            .padding(10)
            .background(configuration.isPressed ? Color.littleLemonPrimaryGreen : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.littleLemonPrimaryGreen, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}


