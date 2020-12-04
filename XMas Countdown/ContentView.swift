//
//  ContentView.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 22.11.2020.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var managedObjectContext

    @FetchRequest(
        entity: GiftModel.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \GiftModel.imageName, ascending: true)
        ]
    )

    var languages: FetchedResults<GiftModel>

    var body: some View {
#if DEBUG
        TabView {
            CountdownView()
                .tabItem {
                    Image(systemName: "timer.square")
                    Text("Countdown")
                }

            AdventCalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }

            DebugView()
                .tabItem {
                    Image(systemName: "gearshape.2")
                    Text("Debug")
                }
        }
#else
        CountdownView()
#endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
