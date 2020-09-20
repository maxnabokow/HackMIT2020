//
//  StudentInfo.swift
//  HackMIT2020 (iOS)
//
//  Created by Max Nabokow on 9/20/20.
//

import Foundation

class StudentInfo {
    
    private init() {}
    static let current = StudentInfo()
    
    var id: String?
    var avatarName: String?
    var school: School = .unc
}
