//
//  rundomIOSApp.swift
//  rundomIOS
//
//  Created by Thomas Bird on 9/27/22.
//

import SwiftUI

@main
struct rundomIOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
