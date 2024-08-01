//
//  Prospect.swift
//  HotProspects
//
//  Created by Groo on 8/1/24.
//

import Foundation
import SwiftData

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContated: Bool
    
    init(name: String, emailAddress: String, isContated: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContated = isContated
    }
}
