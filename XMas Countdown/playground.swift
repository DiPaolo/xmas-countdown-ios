//
//  playground.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 05.12.2020.
//

import SwiftUI

struct playground: View {
    var body: some View {
        Button(action: {
            UserNotificationManager.incrementBageCounter()
        }) {
            Text("Increment app icon counter")
        }
    }
}

struct playground_Previews: PreviewProvider {
    static var previews: some View {
        playground()
    }
}
