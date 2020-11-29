//
//  Gift.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 28.11.2020.
//

import SwiftUI

class Gift: ObservableObject {
    var day: Int // 1..24
    var image: Image
    @Published var isOpened: Bool
    
    init(day: Int, image: Image, isOpened: Bool) {
        self.day = day
        self.image = image
        self.isOpened = isOpened
    }
}

// TODO rename because DTO isn't the best choice
struct GiftDto: Codable {
    var day: Int
    var imageName: String
    var isOpened: Bool
}
