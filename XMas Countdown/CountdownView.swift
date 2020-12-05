//
//  CountdownView.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 21.11.2020.
//

import SwiftUI

let dayX: Date = {
    var date = DateComponents(year: 2020, month: 12, day: 25)
    return Calendar.current.date(from: date)!
}()

struct CountdownView: View {
    let daysLeft = Calendar.current.dateComponents([.day], from: Date(), to: dayX).day!

    let textFont = Font.custom(
        "Party LET",
        size: 60) // 70

    let circleRadius: CGFloat = 200.0 // 250
    let circleFontSize: CGFloat = 170 // 200
    
    @State private var isRedBackground: Bool = true
    @State private var toggleStatus = false

    var body: some View {
        NavigationView {
            VStack {
                Text("It's")
                    .font(textFont)

                NavigationLink(destination: AdventCalendarView()) {
                    Text("\(daysLeft)")
                        .font(.custom("Academy Engraved LET", size: circleFontSize))
                        .baselineOffset(-45)
                        .frame(width: circleRadius, height: circleRadius)
                        .foregroundColor(isRedBackground ? Color.white : Color.red)
                        .background(Circle()
                                        .fill(isRedBackground ? Color.red : Color.white)
                                        .frame(width: circleRadius, height: circleRadius)
                        )
                }

                Text("DAYS")
                    .font(textFont)
                Text("before Christmas")
                    .font(textFont)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .padding(.vertical)
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
