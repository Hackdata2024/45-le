//
//  LegalEase_V3App.swift
//  LegalEase V3
//
//  Created by Shivam Dwivedi on 04/02/24.
//

import SwiftUI

@main
struct LegalEase_V3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
