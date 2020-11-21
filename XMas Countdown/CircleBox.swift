//
//  CircleBox.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 21.11.2020.
//

import SwiftUI

struct CircleBox: View {
//    var image: Image
    var textFont = Font.custom(
//        "Noteworthy",
//        "Papyrus",
        "Party LET",
        size: 70)
    
    var body: some View {
        VStack {
            Text("It's")
                .font(textFont)

            Text("25")
                .font(
                    .custom("Academy Engraved LET", size: 200, relativeTo: .headline)
                )
                .baselineOffset(/*@START_MENU_TOKEN@*/-65.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
                .frame(width: 280.0, height: 280.0)
                .background(Circle()
                .fill(Color.red)
                .frame(width: 250, height: 250))
            
            Text("DAYS")
                .font(textFont)
            Text("before Christmas")
                .font(textFont)
        }
    }
}

struct CircleBox_Previews: PreviewProvider {
    static var previews: some View {
        CircleBox(
//            image: Image(systemName: "shield")
        )
    }
}
