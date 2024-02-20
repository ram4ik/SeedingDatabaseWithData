//
//  SeedingDatabaseWithDataApp.swift
//  SeedingDatabaseWithData
//
//  Created by test on 20.02.2024.
//

import SwiftUI
import SwiftData

@main
struct SeedingDatabaseWithDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [ContactList.self, RelationshipModel.self]) { result in
                    switch result {
                    case .success(let container):
                        do {
                            let fetchDesc = FetchDescriptor<RelationshipModel>()
                            let existingCount = try container.mainContext.fetchCount(fetchDesc)
                            
                            guard existingCount == 0 else { return }
                            
                            container.mainContext.insert(
                                RelationshipModel(
                                    title: "Friend"
                                )
                            )
                            container.mainContext.insert(
                                RelationshipModel(
                                    title: "Colleague"
                                )
                            )
                            container.mainContext.insert(
                                RelationshipModel(
                                    title: "Neighbor"
                                )
                            )
                            container.mainContext.insert(
                                RelationshipModel(
                                    title: "Acquaintance"
                                )
                            )
                        } catch {
                            print("Error occur while seeding data \(error.localizedDescription)")
                        }
                    case .failure(let error):
                        print("Error creating container \(error.localizedDescription)")
                    }
                }
        }
    }
}
