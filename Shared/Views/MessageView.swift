//
//  MessageView.swift
//  HackMIT2020
//
//  Created by Max Nabokow on 9/19/20.
//

import SwiftUI
import StreamChatClient

struct MessageView: View {
    
    @State var message: Message
    
    var background: some View {
        if (message.user.isCurrent) {
            return Color("hRed").opacity(1)
        } else {
            return Color.gray.opacity(0.25)
        }
    }
    
    var title: some View {
        if message.user.isCurrent {
            return Text("")
        } else {
            return Text(message.user.id).font(.footnote)
        }
    }
    
    var body: some View {
        HStack {
            if message.user.isCurrent { Spacer() }
            VStack(alignment: .leading) {
                if (!message.user.isCurrent) {
                    title
                }
                Text(message.text)
                    .foregroundColor(message.user.isCurrent ? .white : .primary)
                .padding(8)
                .background(background)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }
            if !message.user.isCurrent { Spacer() }
        }.frame(maxWidth: .infinity)
    }
}
