//
//  HomeView.swift
//  HackMIT2020 (iOS)
//
//  Created by Max Nabokow on 9/20/20.
//

import SwiftUI

struct HomeView: View {
    
    @State var tab: Int = 0
    
    var body: some View {
        TabView(selection: $tab) {
            YourSchoolView()
                .tabItem {
                    Image(systemName: "building.columns.fill")
                    Text(StudentInfo.current.school.name)
                }
            ChatView()
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                    Text("Chat")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
