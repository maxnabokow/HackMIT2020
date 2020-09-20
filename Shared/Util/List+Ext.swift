//
//  List+Ext.swift
//  HackMIT2020
//
//  Created by Max Nabokow on 9/19/20.
//

import SwiftUI

extension List {
    @ViewBuilder func noSeparators() -> some View {
        #if swift(>=5.3) // Xcode 12
        if #available(iOS 14.0, *) { // iOS 14
            self
            .accentColor(Color.secondary)
            .listStyle(SidebarListStyle())
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.systemBackground
            }
        } else { // iOS 13
            self
                        .listStyle(PlainListStyle())
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
        }
        #else // Xcode 11.5
        self
                .listStyle(PlainListStyle())
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
        #endif
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
