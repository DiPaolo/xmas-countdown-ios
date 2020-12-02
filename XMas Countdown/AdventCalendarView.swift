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
            NavigationLink(destination: GiftDetails(gift: giftModel[idx])) {
//                Image(systemName: "\(giftModel[idx].day).circle")
//                    .resizable()
                GiftView(gift: giftModel[idx])
            }
        }
        .navigationBarTitle(Text("Advent Calendar"))
//        .navigationBarHidden(true)
    }
}

struct AdventCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        AdventCalendarView()
    }
}
