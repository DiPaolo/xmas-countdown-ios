//
//  GiftDetails.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 30.11.2020.
//

import SwiftUI

struct GiftDetails: View {
    @ObservedObject var gift: GiftModel
    var image: Image
    
    init(gift: GiftModel) {
        self.gift = gift
        image = Image(gift.imageName!)
    }

    var body: some View {
        ZStack {
            Image(systemName: "\(gift.day).circle")
                .resizable()
                .opacity(gift.isOpened ? 0.0 : 1.0)
                .onTapGesture {
                    gift.isOpened = !gift.isOpened
                    PersistentStore.saveContext()
                }

            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(gift.isOpened ? 1.0 : 0.0)
        }
        .navigationBarTitle("")
//        .navigationBarHidden(true)
    }
}

struct GiftDetails_Previews: PreviewProvider {
    static var previews: some View {
        GiftDetails(gift: GiftModel())
    }
}
