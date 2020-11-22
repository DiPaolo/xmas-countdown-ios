//
//  PresentView.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 22.11.2020.
//

import SwiftUI

struct PresentView: View {
    var day: Int // 1..24

    @State private var toggleStatus = false
    
    var body: some View {
        ZStack {
            Image(systemName: "rectangle")
                .resizable()
                .opacity(toggleStatus ? 0.0 : 1.0)
                .onTapGesture {
                    toggleStatus = !toggleStatus
                }

            Image(systemName: "\(day).circle")
                .resizable()
                .opacity(!toggleStatus ? 0.0 : 1.0)
                .onTapGesture {
                    toggleStatus = !toggleStatus
                }
        }
    }
}

struct PresentView_Previews: PreviewProvider {
    static var previews: some View {
        PresentView(day: 13)
    }
}
