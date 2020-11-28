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
    private let rows = 6
    private let columns = 4
    
    private var dates = [Int]()
    private var imageIndexes = initShuffledArray(size: 24)
    
    var body: some View {
        GridStack(rows: self.rows, columns: self.columns) { row, col in
            let day = dates[row * self.columns + col]
            GiftView(day: day, giftImage: getImage(pack: "The Star Wars", index: imageIndexes[day - 1]), isOpened: false)
        }
    }
    
    init() {
        initDates()
        initImageIndexes()
    }
    
    private mutating func initDates() {
        print("Initializing dates...")
        
        if UserDefaults.standard.object(forKey: "DateList") == nil {
            // initialize the days from 1 to 24 in random order
            
            let days = initShuffledArray(size: 24)
            print("Initialized 'DateList' with the values:")
            print(days)
            
            UserDefaults.standard.set(days, forKey: "DateList")
        }
        
        dates = UserDefaults.standard.array(forKey: "DateList") as? [Int] ?? [Int]()
        print(dates)
        print()
    }
    
    private mutating func initImageIndexes() {
        print("Initializing image indexes...")
        
        if UserDefaults.standard.object(forKey: "ImageIndexList") == nil {
            // initialize image indexes from 1 to 24 in random order
            
            let imageIndexes = initShuffledArray(size: 24)
            print("Initialized 'ImageIndexList' with the values:")
            print(imageIndexes)
            
            UserDefaults.standard.set(imageIndexes, forKey: "ImageIndexList")
        }
        
        imageIndexes = UserDefaults.standard.array(forKey: "ImageIndexList") as? [Int] ?? [Int]()
        print(imageIndexes)
        print()
    }
}

fileprivate func initShuffledArray(size: Int) -> Array<Int> {
    var array = Array(repeating: 0, count: size)
    for i in 0..<size {
        array[i] = i + 1
    }
    
    array.shuffle()
    return array
}

struct AdventCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        AdventCalendarView()
    }
}
