//
//  SettingsView.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 22.11.2020.
//

import SwiftUI

struct DebugView: View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    
    @FetchRequest(
        entity: GiftModel.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \GiftModel.imageName, ascending: true)
        ]
    )
    
    var gifts: FetchedResults<GiftModel>
    
    var body: some View {
        VStack {
            List(gifts, id: \.self) { gift in
                HStack {
                    Text("day=\(gift.day), imageName=\(gift.imageName ?? "-")")
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
