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

    var textFont = Font.custom(
//        "Noteworthy",
//        "Papyrus",
        "Party LET",
        size: 70)
    
    var body: some View {
        VStack {
            Text("It's")
                .font(textFont)
            
            Text("\(daysLeft)")
                .font(.custom("Academy Engraved LET", size: 200))
                .baselineOffset(-45)
                .frame(width: 250, height: 250)
                .foregroundColor(Color.white)
                .background(Circle()
                                .fill(Color.red)
                                .frame(width: 250, height: 250)
                )
            
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
