//
//  PresentView.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 22.11.2020.
//

import CoreData
import SwiftUI

struct GiftView: View {
    @ObservedObject var gift: GiftModel
    
    var image: Image
    var giftIconSize: CGFloat
    
    init(gift: GiftModel, giftIconSize: Int) {
        self.gift = gift
        image = Image(gift.imageName!)
        self.giftIconSize = CGFloat(giftIconSize)
    }
    
    var body: some View {

        ZStack {
            VStack {
                Text("Open Me!")

                Image(systemName: "gift")
                    .resizable()
                    .frame(width: giftIconSize, height: giftIconSize)
                    .foregroundColor(.red)
                    .onTapGesture {
                        gift.isOpened = !gift.isOpened
                        PersistentStore.saveContext()
                    }
            }
            .opacity(gift.isOpened ? 0.0 : 1.0)

            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(gift.isOpened ? 1.0 : 0.0)
        }
    }
}

struct PresentView_Previews: PreviewProvider {
    static var previews: some View {
        let giftsFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "GiftModel")

        do {
            let fetchedGifts = try PersistentStore.context.fetch(giftsFetch) as! [GiftModel]
            return GiftView(gift: fetchedGifts[1], giftIconSize: 128)
        } catch {
            fatalError("Failed to fetch gifts: \(error)")
        }
    }
}
