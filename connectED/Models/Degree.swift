//
//  Degree.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/30/25.
//

import SwiftUI

struct Degree: Identifiable, Codable {
    var id: String
    var field: String?
    var department: String?
    var description: String?
    
    init(id: String, department: String? = nil, field: String? = nil, description: String? = nil) {
        self.id = id
        self.field = field
        self.department = department
        self.description = description
    }
}
