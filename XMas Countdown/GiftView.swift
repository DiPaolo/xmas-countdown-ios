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

    let daysLeft = Calendar.current.dateComponents([.day], from: Date(), to: dayX).day!

    var isFullScreen: Bool = false
    
    init(gift: GiftModel, isFullScreen: Bool) {
        self.gift = gift
        self.isFullScreen = isFullScreen
    }
    
    var body: some View {
        ZStack {
            // can't be opened (too early)
            Text("It's too early to open a gift box ;(")
                .opacity(isFullScreen && !gift.isOpened && gift.day >= 25 - daysLeft ? 1.0 : 0.0)

            // allow the user to open
            ReadyToOpenGiftView(gift: self.gift)
                .opacity(isFullScreen && !gift.isOpened && gift.day < 25 - daysLeft ? 1.0 : 0.0)

            // opened gift
            OpenedGiftView(gift: self.gift)
        }
    }
}

struct ReadyToOpenGiftView: View {
    @ObservedObject var gift: GiftModel

    @State var animation: Bool = false
    
    var body: some View {
        VStack {
            Text("Open Me!")

            ZStack {
                if animation {
                Image(systemName: "gift")
                    .resizable()
                    .foregroundColor(.red)
                    .onTapGesture {
                        gift.isOpened = !gift.isOpened
                        PersistentStore.saveContext()
                    }
                    .transition(AnyTransition.scale.animation(.easeInOut(duration: 5.0)))
                }
            }
            .onAppear {
                self.animation.toggle()
            }
        }
    }
}

struct OpenedGiftView : View {
    @ObservedObject var gift: GiftModel

    @State var animation: Bool = false
    
    var image: Image
    
    init(gift: GiftModel) {
        self.gift = gift
        self.image = Image(gift.imageName!)
    }

    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .opacity(!gift.isOpened ? 0.0 : 1.0)
    }
}

struct PresentView_Previews: PreviewProvider {
    static var previews: some View {
        let giftsFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "GiftModel")

        do {
            let fetchedGifts = try PersistentStore.context.fetch(giftsFetch) as! [GiftModel]
            return GiftView(gift: fetchedGifts[1], isFullScreen: true)
        } catch {
            fatalError("Failed to fetch gifts: \(error)")
        }
    }
}
