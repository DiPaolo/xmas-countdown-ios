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
            NSSortDescriptor(keyPath: \GiftModel.imageName, ascending: true)
        ]
    )
    
    var giftModel: FetchedResults<GiftModel>
    
    private let rows = 6
    private let columns = 4
    
    private var gifts = [Gift]()
    private var imageIndexes = initShuffledArray(size: 24)
    
    var body: some View {
        GridStack(rows: self.rows, columns: self.columns) { row, col in
//            let day = gifts[row * self.columns + col].day
//            GiftView(gift: Gift(day: day, image: getImage(pack: "The Star Wars", index: imageIndexes[day - 1]), isOpened: false))
        }
    }
    
    init() {
        print("WTF")
        for gift in giftModel {
            print("--")
            print("\(gift.imageName!)")
        }
//        print("GiftModel has \(giftModel2.size()) elements")
    }
    
    private mutating func initGifts() {
        print("Initializing gifts...")

        if UserDefaults.standard.object(forKey: "GiftList") == nil {
            print("Initializing gifts...")
            
            let daysInAdvent = 24
            
            let days = initShuffledArray(size: daysInAdvent)
            let imageIndexes = initShuffledArray(size: daysInAdvent)

            var gifts = Array<GiftDto>(repeating: GiftDto(day: 0, imageName: "", isOpened: false), count: daysInAdvent)
            for i in 0..<daysInAdvent {
                gifts[i].day = days[i]
                gifts[i].imageName = "The Star Wars/\(imageIndexes[i])"
                gifts[i].isOpened = false
            }
            
            for i in 0..<daysInAdvent {
                print("day \(gifts[i].day) - \(gifts[i].imageName)")
            }
        }
        
        if let giftList = UserDefaults.standard.data(forKey: "GiftList") {
            do {
                gifts.removeAll()
                let decoder = JSONDecoder()
                let giftDtos = try decoder.decode([GiftDto].self, from: giftList)
                for giftDto in giftDtos {
                    gifts.append(Gift(day: giftDto.day, image: Image(giftDto.imageName), isOpened: giftDto.isOpened))
                }
            } catch {
                print("Unable to read gift list. Error: (\(error))")
            }
        }
        
        // add an extra free space after initialization's log
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
