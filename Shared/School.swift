//
//  School.swift
//  HackMIT2020 (iOS)
//
//  Created by Max Nabokow on 9/20/20.
//

import Foundation

struct School {
    let name: String
    let logoName: String
    let phones: [(String, String)]
    let emails: [(String, String)]
    let urls: [(String, String)]
    let sections: [(sectionTitle: String, text: String)]
    
    static let unc: School = .init(
        name: "UNC",
        logoName: "UNC",
        phones: [
            ("Campus Health", "(919) 966-2281"),
            ("Transportation", "(919) 962-7867"),
            ("Food / Meals", "(480) 688-3883"),
        ],
        emails: [
            ("UNC Housing", "housing@unc.edu"),
            ("Campus Health", "campushealth@unc.edu"),
        ],
        urls: [
            ("Absence Request", "attendance.unc.edu"),
            ("UNC Housing", "housing.unc.edu"),
            ("Housing Portal", "unc.starrezhousing.com"),
        ],
        sections: [
            (sectionTitle: "How to get to Isolation", text: "You can either walk yourself to Parker Hall, or if you already live on campus (including in Granville Towers) you may also request a ride with Point to Point (P2P)  On Demand services. If you would like to use P2P please call their dispatch at 919-962-7867 and specify the destination as \"Parker Residential Hall\"."),
            (sectionTitle: "Class and Work Absences", text: "If you are taking in-person classes or online classes, and you are experiencing symptoms that inhibit your ability to attend classes or complete coursework, you can submit a request to the University Approved Absence Office for up to 14 consecutive days of University Approved Absences (UAA’s)."),
            (sectionTitle: "Check-out Instructions", text: "Put all trash into the large bin in the basement of Parker.\nScan the room for all personal belongings.\nPlace your Parker keys in the Carolina Housing Express Check-Out Key Envelope and place envelope into Express Check-Out Box located in the main lobby of Parker Hall.")
        ]
    )
}
