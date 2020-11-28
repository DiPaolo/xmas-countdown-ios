//
//  PresentView.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 22.11.2020.
//

import SwiftUI

struct GiftView: View {
    var day: Int // 1..24
    var giftImage: Image

    @State private var isOpened = true
    
    init(day: Int, giftImage: Image, isOpened: Bool) {
        self.day = day
        self.giftImage = giftImage
        self.isOpened = isOpened
    }
    
    var body: some View {
        ZStack {
            Image(systemName: "rectangle")
                .resizable()
                .opacity(isOpened ? 1.0 : 0.0)
                .onTapGesture {
                    isOpened = !isOpened
                }

            giftImage.resizable()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(isOpened ? 0.0 : 1.0)
                .onTapGesture {
                    isOpened = !isOpened
                }
        }
    }
}

struct PresentView_Previews: PreviewProvider {
    static var previews: some View {
        GiftView(day: 13, giftImage: getImage(pack: "The Star Wars", index: 0), isOpened: true)
    }
}
