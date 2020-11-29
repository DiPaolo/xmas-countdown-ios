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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, context)
        }
    }
}
