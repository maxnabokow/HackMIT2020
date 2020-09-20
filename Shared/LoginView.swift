//
//  LoginView.swift
//  HackMIT2020
//
//  Created by Max Nabokow on 9/19/20.
//

import SwiftUI
import FirebaseAuth
import StreamChatClient

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var showChat: Bool = false
    
    var body: some View {
        VStack {
            TextField("Type username", text: $username).padding()
            
            Button(action: logIn) {
                Text("Log in")
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .sheet(isPresented: $showChat, content: {
            ChatView()
        })
        .navigationBarTitle("Log in", displayMode: .inline)
    }
    
    func logIn() {
        
    }
}


