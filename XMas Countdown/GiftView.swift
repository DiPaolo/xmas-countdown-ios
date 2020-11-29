//
//  PresentView.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 22.11.2020.
//

import SwiftUI

struct GiftView: View {
    @ObservedObject var gift: Gift
    
    var body: some View {
        ZStack {
            Image(systemName: "\(gift.day).circle")
                .resizable()
                .opacity(gift.isOpened ? 1.0 : 0.0)
                .onTapGesture {
                    gift.isOpened = !gift.isOpened
                }

            gift.image.resizable()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(gift.isOpened ? 0.0 : 1.0)
                .onTapGesture {
                    gift.isOpened = !gift.isOpened
                }
        }
    }
}

struct PresentView_Previews: PreviewProvider {
    static var previews: some View {
        GiftView(gift: Gift(day: 13, image: getImage(pack: "The Star Wars", index: 0), isOpened: true))
    }
}
