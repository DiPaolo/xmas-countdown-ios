//
//  AdventCalendarView.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 22.11.2020.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct AdventCalendarView: View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    
    @FetchRequest(
        entity: GiftModel.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \GiftModel.objectID, ascending: true)
        ]
    )
    
    var giftModel: FetchedResults<GiftModel>
    
    private let rows = 6
    private let columns = 4
    
    var body: some View {
        GridStack(rows: self.rows, columns: self.columns) { row, col in
            let idx = row * self.columns + col
            NavigationLink(destination: GiftView(gift: giftModel[idx], isFullScreen: true)) {
                ZStack {
                    Image(systemName: "\(giftModel[idx].day).circle")
                        .resizable()
                        .accentColor(.gray)
                        .opacity(giftModel[idx].isOpened ? 0.0 : 1.0)

                    Image(systemName: "gift")
                        .accentColor(.red)
                        .offset(x: 16, y: 16)
                        .opacity(!giftModel[idx].isOpened && DateHelper.isGiftReadyToBeOpened(giftModel[idx].day) ? 1.0 : 0.0)
                    
                    GiftView(gift: giftModel[idx], isFullScreen: false)
                        .opacity(giftModel[idx].isOpened ? 1.0 : 0.0)
                }
            }
        }
        .navigationBarTitle(Text("Advent Calendar"))
    }
}

struct AdventCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        AdventCalendarView()
    }
}
