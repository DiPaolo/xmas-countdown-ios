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
    var dates = [Int]()
    
    let rows = 6
    let columns = 4
    
    var body: some View {
        GridStack(rows: self.rows, columns: self.columns) { row, col in
            PresentView(day: dates[row * self.columns + col])
        }
    }
    
    init() {
        if UserDefaults.standard.object(forKey: "DateList") == nil {
            // initialize the days from 1 to 24 in random order
            
            var days = Array(repeating: 0, count: 24)
            for i in 0..<24 {
                days[i] = i + 1
            }

            days.shuffle()
            
            print("Initialized 'DateList' with the values:")
            print(days)
            
            UserDefaults.standard.set(days, forKey: "DateList")
        }
        
        dates = UserDefaults.standard.array(forKey: "DateList") as? [Int] ?? [Int]()
        print("Initializing dates...")
        print(dates)
    }
}

struct AdventCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        AdventCalendarView()
    }
}
