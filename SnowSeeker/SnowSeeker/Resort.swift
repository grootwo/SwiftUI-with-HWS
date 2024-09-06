//
//  Resort.swift
//  SnowSeeker
//
//  Created by Groo on 9/4/24.
//

import Foundation

struct Resort: Codable, Hashable, Identifiable, Equatable {
    let id: String
    let name: String
    let country: String
    let description: String
    let imageCredit: String
    let price: Int
    let size: Int
    let snowDepth: Int
    let elevation: Int
    let runs: Int
    let facilities: [String]
    var facilityTypes: [Facility] {
        facilities.map(Facility.init)
    }
    
    static let resorts: [Resort] = Bundle.main.decode(file: "resorts.json")
    static let example = resorts[0]
}
