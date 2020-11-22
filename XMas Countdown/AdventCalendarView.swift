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
    let rows = 6
    let columns = 4
    
    var body: some View {
        GridStack(rows: self.rows, columns: self.columns) { row, col in
            PresentView(day: row * self.columns + col + 1)
        }
    }
}

struct AdventCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        AdventCalendarView()
    }
}
