//
//  ContentView.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 21.11.2020.
//

import SwiftUI

let dayX: Date = {
    var date = DateComponents(year: 2020, month: 12, day: 25)
    return Calendar.current.date(from: date)!
}()

struct ContentView: View {
    let daysLeft = Calendar.current.dateComponents([.day], from: Date(), to: dayX).day!

    let textFont = Font.custom(
//        "Noteworthy",
//        "Papyrus",
        "Party LET",
        size: 70)
    
    @State private var hidden = false
    @State private var hasOffset = false
    @State private var isRedBackground: Bool = false
    @State private var toggleStatus = false

    var body: some View {
        VStack {
            Button("Tap Me") {
                self.hidden = true
            }
            .opacity(hidden ? 0 : 1)
            .animation(.easeInOut(duration: 2))

            Button("Tap Me") {
                       withAnimation(.interpolatingSpring(
                           mass: 1,
                           stiffness: 80,
                           damping: 4,
                           initialVelocity: 0)) {
                               self.hasOffset.toggle()
                           }
                   }
                   .offset(y: hasOffset ? 40 : 0)

            Toggle(isOn: $isRedBackground) {
                Text("Red?")
            }
            .padding()

            Text("It's")
                .font(textFont)

            ZStack {
                Text("\(daysLeft)")
                    .font(.custom("Academy Engraved LET", size: 200))
                    .baselineOffset(-45)
                    .frame(width: 250, height: 250)
                    .foregroundColor(isRedBackground ? Color.white : Color.red)
                    .background(Circle()
                                    .fill(isRedBackground ? Color.red : Color.white)
                                    .frame(width: 250, height: 250)
                    )
                    .opacity(toggleStatus ? 0.0 : 1.0)
                    .onTapGesture {
                        self.toggleStatus = !self.toggleStatus
                        print("Show details for Enterprise")
                    }

                Text("Surprise")
//                    .font(.custom("Academy Engraved LET", size: 200))
//                    .baselineOffset(-45)
                    .frame(width: 250, height: 250)
                    .foregroundColor(isRedBackground ? Color.red : Color.white)
                    .background(Rectangle()
                                    .fill(isRedBackground ? Color.white : Color.red)
                                    .frame(width: 250, height: 250)
                    )
                    .opacity(!toggleStatus ? 0.0 : 1.0)
                    .onTapGesture {
                        self.toggleStatus = !self.toggleStatus
                        print("Show details for Enterprise")
                    }
            }

            Text("DAYS")
                .font(textFont)
                .baselineOffset(-24)
            Text("before Christmas")
                .font(textFont)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
