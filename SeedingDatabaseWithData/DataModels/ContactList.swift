//
//  ContactList.swift
//  SeedingDatabaseWithData
//
//  Created by test on 20.02.2024.
//

import Foundation
import SwiftData

@Model
final class ContactList {
    var name: String
    var phone: String
    var relationship: String
    
    init(name: String, phone: String, relationship: String) {
        self.name = name
        self.phone = phone
        self.relationship = relationship
    }
}
