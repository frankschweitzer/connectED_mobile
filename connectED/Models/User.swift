//
//  User.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/29/25.
//

import SwiftUI

struct User: Identifiable, Codable {
    var id: String
    var email: String?
    var firstName: String?
    var lastName: String?
    var displayName: String?
    var university: String?
    var major: String?
    
    init(id: String, email: String?, firstName: String?, lastName: String?, displayName: String?, university: String?, major: String?) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.displayName = displayName
        self.university = university
        self.major = major
    }
}
