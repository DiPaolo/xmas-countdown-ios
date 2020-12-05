//
//  XMas_CountdownApp.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 21.11.2020.
//

import SwiftUI

@main
struct XMas_CountdownApp: App {
    let context = PersistentStore.persistentContainer.viewContext
    
    init() {
        print("Checking if the persistance container initialized...")
        if PersistentStore.isContainerInitialized(PersistentStore.persistentContainer) {
            print("      OK, it's initialized")
        } else {
            print("      Not initialized.")
            
            print("Initializing...")
            PersistentStore.initializeContainer(PersistentStore.persistentContainer)
            PersistentStore.saveContext()
            
            print("   Checking if the persistance container initialized...")
            if PersistentStore.isContainerInitialized(PersistentStore.persistentContainer) {
                print("      OK, it's initialized")
            } else {
                print("      Not initialized.")
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, context)
        }
    }
}
