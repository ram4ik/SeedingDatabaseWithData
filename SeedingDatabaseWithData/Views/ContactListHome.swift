//
//  ContactListHome.swift
//  SeedingDatabaseWithData
//
//  Created by test on 20.02.2024.
//

import SwiftUI
import SwiftData

struct ContactListHome: View {
    
    @Query(sort: \ContactList.name) var contacts: [ContactList]
    @Query(sort: \RelationshipModel.title) var relationships: [RelationshipModel]
    
    @State private var showAddNew = false
    
    var body: some View {
        NavigationStack {
            List(contacts) { contact in
                VStack(alignment: .leading) {
                    Text(contact.name)
                        .font(.title3)
                    
                    Group {
                        Text(contact.phone)
                        Text(contact.relationship)
                    }
                    .font(.body)
                    .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showAddNew.toggle()
                    }, label: {
                        Image(systemName: "plus.circle")
                    })
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $showAddNew, content: {
                        AddNewContact(relationships: relationships)
                            .presentationDetents([.medium])
                    })
                }
            }
        }
    }
}
