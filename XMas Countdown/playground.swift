//
//  playground.swift
//  XMas Countdown
//
//  Created by Pavel Ditenbir on 05.12.2020.
//

import SwiftUI

struct playground: View {
    
    @State var showingDetail = false

    var body: some View {
        Button(action: {
            self.showingDetail.toggle()
        }) {
            Text("Info")
        }.sheet(isPresented: $showingDetail) {
//            DetailView()
            VStack {
                Text("WTF")
                Spacer()
                Button("Close") {
                }
            }
            .padding()
        }
    }
    
//    var body: some View {
//        Image("The Star Wars/1")
//            .sheet(isPresented: , content: {
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Sheet Content")/*@END_MENU_TOKEN@*/
//            }) {
////            .popover(isPresented: .constant(true), arrowEdge: .bottom) {
//                VStack {
//                    Text("WTF")
//                    Spacer()
//                    Button("Close") {
//                    }
//                }
//                .padding()
//
//            }
////            .dismiss
////            .resizable()
//    }
}

struct playground_Previews: PreviewProvider {
    static var previews: some View {
        playground()
    }
}
