//
//  ChatView.swift
//  HackMIT2020
//
//  Created by Max Nabokow on 9/19/20.
//

import SwiftUI
import StreamChatClient

struct ChatView: View {
    
    let channel = Client.shared.channel(type: .messaging, id: "unc")
    
    @State var text: String = ""
    @State var messages: [Message] = []
    
    var body: some View {
        VStack {
            
            HStack {
                Image("UNC")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                Text("UNC Chat").bold()
            }
            
            List(messages.reversed(), id: \.self) {
                MessageView(message: $0)
                    .scaleEffect(x: 1, y: -1, anchor: .center)
                    .animation(.spring())
            }
            .noSeparators()
            .scaleEffect(x: 1, y: -1, anchor: .center)
            .offset(x: 0, y: 2)
            .onTapGesture { self.hideKeyboard() }
            
            HStack {
                TextField("Type a message", text: $text)
                Button(action: self.send) {
                    Image(systemName: "arrow.up.square.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color("hRed"))
                }
            }.padding()
        }
        .navigationBarHidden(true)
        .onAppear(perform: onAppear)
    }
    
    func send() {
        
        guard !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        
        channel.send(message: .init(text: text)) {
            switch $0 {
            case .success(let response):
                print(response)
                self.text = ""
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func onAppear() {        
        channel.watch(options: [.all]) {
            switch $0 {
            case .success(let response):
                self.messages += response.messages
            case .failure(let error):
                break
            }
        }
        
        channel.subscribe(forEvents: [.messageNew]) {
            switch $0 {
            case .messageNew(let message, _, _, _, _):
                self.messages += [message]
            default:
                break
            }
        }
    }
    
}
