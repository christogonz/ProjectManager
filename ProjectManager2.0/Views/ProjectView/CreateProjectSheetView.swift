//
//  CreateProjectSheet.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-17.
//

import SwiftUI

struct CreateProjectSheetView: View {
    @Binding var newProjectName: String
    @Binding var newProjectDescription: String
    @Binding var selectedStore: [Store]
    var storeViewModel: StoreViewModel
    var onSave: () -> Void
    
    var body: some View {
        VStack {
            
            TextField("Project Name", text: $newProjectName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Project Description", text: $newProjectDescription)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            List {
                ForEach(storeViewModel.stores) {store in
                    MultipleSelectionRow(store: store, isSelected: selectedStore.contains(where: { $0.id == store.id})) {
                        if selectedStore.contains(where: { $0.id == store.id }) {
                            selectedStore.removeAll { $0.id == store.id}
                        } else {
                            selectedStore.append(store)
                        }
                    }
                }
            }
            
            Button("Add Project") {
                onSave()
            }
            .padding()
        }
    }
}

