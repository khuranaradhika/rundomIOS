//
//  rundomIOSApp.swift
//  rundomIOS
//
//  Created by Thomas Bird on 9/27/22.
//

import SwiftUI
import Firebase

@main
struct rundomIOSApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var firestoreManager = FirestoreManager()

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(firestoreManager)
        }
    }
    
}
