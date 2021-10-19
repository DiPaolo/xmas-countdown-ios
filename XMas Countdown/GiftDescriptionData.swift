//
//  GiftDescriptionData.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 05.12.2020.
//

import SwiftUI

struct GiftDataEntity: Decodable {
    var imageName: String
    var name: String
    var itemNo: String
    var link: String
    var description: String
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    print("load")
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
