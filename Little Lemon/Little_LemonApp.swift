//
//  Little_LemonApp.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.02.
//

import SwiftUI

@main
struct Little_LemonApp: App {
    let persistence = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            Onboarding()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
}
