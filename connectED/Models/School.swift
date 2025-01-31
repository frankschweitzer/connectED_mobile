//
//  School.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/30/25.
//

import SwiftUI

struct School: Identifiable, Codable {
    var id: String?
    var name: String?
    var location: String?
    
    init(id: String, name: String? = nil, location: String? = nil) {
        self.id = id
        self.name = name
        self.location = location
    }
}
