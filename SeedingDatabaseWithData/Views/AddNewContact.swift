//
//  AddNewContact.swift
//  SeedingDatabaseWithData
//
//  Created by test on 20.02.2024.
//

import SwiftUI
import SwiftData

struct AddNewContact: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    private var relationships: [RelationshipModel]
    
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var relationship: String
    
    init(relationships: [RelationshipModel]) {
        self.relationships = relationships
        _relationship = State(initialValue: relationships[0].title)
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Name")
                TextField("Enter name", text: $name)
                
                Text("Phone number")
                TextField("Enter phone", text: $phone)
                
                Picker(selection: $relationship) {
                    ForEach(relationships) { relationship in
                        Text(relationship.title)
                            .tag(relationship.title)
                    }
                } label: {
                    Text("")
                }
                .labelsHidden()
                
                Button(action: {
                    let newContact = ContactList(name: name, phone: phone, relationship: relationship)
                    context.insert(newContact)
                    dismiss()
                }, label: {
                    Text("Save & Close")
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.borderedProminent)
            }
            .padding(.horizontal)
            .navigationTitle("Add new contact")
        }
    }
}

