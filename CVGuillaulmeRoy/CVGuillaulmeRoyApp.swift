//
//  CVGuillaulmeRoyApp.swift
//  CVGuillaulmeRoy
//
//  Created by guill roy on 05/09/2024.
//

import SwiftUI
import SwiftData

@main
struct CVGuillaulmeRoyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
          MainView()
        }
        .modelContainer(sharedModelContainer)
    }
}
