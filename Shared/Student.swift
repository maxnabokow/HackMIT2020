//
//  Student.swift
//  HackMIT2020 (iOS)
//
//  Created by Max Nabokow on 9/20/20.
//

import SwiftUI

struct Student: Identifiable {
    var id = UUID()
    var avatarName: String?
    var status: String?
    var school: School?
    
    enum Status: String, Codable, CaseIterable {

        case cautios
        case quarantined
        case isolated
        case recovered

        static func getColor(for status: Status) -> Color {
            switch status {
            case .cautios:
                return .blue
            case .quarantined:
                return .orange
            case .isolated:
                return .red
            case .recovered:
                return .green
            }
        }

        private enum CodingKeys: String, CodingKey {
            case cautious = "cautious"
            case quarantined = "quarantined"
            case isolated = "isolated"
            case recovered = "recovered"
        }
    }
}
