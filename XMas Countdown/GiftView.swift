//
//  PresentView.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 22.11.2020.
//

import CoreData
import SwiftUI

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}

struct GiftView: View {
    @ObservedObject var gift: GiftModel
    
    var image: Image
    var giftIconSize: CGFloat
    @State var animation: Bool = false
    
    init(gift: GiftModel, giftIconSize: Int) {
        self.gift = gift
        image = Image(gift.imageName!)
        self.giftIconSize = CGFloat(giftIconSize)
    }
    
    var body: some View {

        ZStack {
            VStack {
                Text("Open Me!")

                ZStack {
                    if animation {
                    Image(systemName: "gift")
                        .resizable()
                        .frame(width: giftIconSize, height: giftIconSize)
                        .foregroundColor(.red)
                        .onTapGesture {
                            gift.isOpened = !gift.isOpened
                            PersistentStore.saveContext()
                        }
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 5.0)))
                    }
                }
                .onAppear {
                    self.animation.toggle()
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
