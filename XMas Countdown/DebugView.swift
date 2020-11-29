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
    
    var languages: FetchedResults<GiftModel>
    
    var body: some View {
        VStack {
            List(languages, id: \.self) { language in
                HStack {
                    Text("day=\(language.day), imageName=\(language.imageName ?? "-")")
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
