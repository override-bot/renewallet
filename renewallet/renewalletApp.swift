//
//  renewalletApp.swift
//  renewallet
//
//  Created by Wisdom Chukwudi on 4/28/23.
//

import SwiftUI

@main
struct renewalletApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
