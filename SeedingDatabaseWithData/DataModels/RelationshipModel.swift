//
//  RelationshipModel.swift
//  SeedingDatabaseWithData
//
//  Created by test on 20.02.2024.
//

import Foundation
import SwiftData

@Model
final class RelationshipModel {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
