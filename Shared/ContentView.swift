//
//  ContentView.swift
//  Shared
//
//  Created by Max Nabokow on 9/19/20.
//

import SwiftUI
import FirebaseAuth
import StreamChatClient

struct ContentView: View {
    
    @State var showSetup = false
    @State var showHome = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(16)
                Text("PandeMeet")
                    .font(.largeTitle).bold()
                Text("Connect. Confide. Control.")
                    .fontWeight(.thin)
                NavigationLink(
                    destination: HomeView(),
                    isActive: $showHome,
                    label: { EmptyView() })
            }
            .onLongPressGesture { authenticate() }
//            .onTapGesture { showHome = true }
            .navigationBarHidden(true)
        }
        .fullScreenCover(isPresented: $showSetup) {
            SetupView()
        }
        .onAppear(perform: signOut)
    }
    
    func signOut() {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
            } catch {
                print("❌ Sign-out failed")
            }
        }
    }
    
    func authenticate() {
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously { (result, error) in
                guard let student = result?.user else { return }
                print("✅ Auth worked!!")
                let uid = student.uid
                StudentInfo.current.id = uid
                Client.shared.set(user: User(id: uid), token: .development)
                showHome = true
            }
            showSetup = true
        } else {
            StudentInfo.current.id = Auth.auth().currentUser?.uid
            Client.shared.set(user: User(id: StudentInfo.current.id!), token: .development)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
