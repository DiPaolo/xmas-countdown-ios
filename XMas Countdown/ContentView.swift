//
//  ContentView.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 22.11.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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

            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.2")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
