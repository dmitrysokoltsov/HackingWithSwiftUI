//
//  Missions.swift
//  Moonshot
//
//  Created by Dmitry Sokoltsov on 24.06.2022.
//

import Foundation

struct Missions: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
        
    }
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo\(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
