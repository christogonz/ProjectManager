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
    @State private var selectedChain = "Elgiganten"
    
    let storeChains = ["Elgiganten", "Telia", "Tele2", "Telenor", "Tre"]
    
    var body: some View {
        VStack {
            
            TextField("Project Name", text: $newProjectName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Project Description", text: $newProjectDescription)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(storeChains, id: \.self) {
                        chain in
                        Text(chain)
                            .padding()
                            .background(chain ==  selectedChain ? Color.blue : .gray.opacity(0.2))
                            .clipShape(.rect(cornerRadius: 8))
                            .foregroundStyle(chain == selectedChain ? .white : .gray)
                            .onTapGesture {
                                selectedChain = chain
                            }
                    }
                }
                .padding()
            }
            
            
            List {
                ForEach(storeViewModel.stores.filter {$0.chain == selectedChain }) {store in
                    
                    
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

#Preview {
    @Previewable @State var newProjectName = ""
    @Previewable @State var newProjectDescription = ""
    @Previewable @State var selectedStore: [Store] = [
        Store(name: "Elgiganten", locations: "Bromma", chain: "Elgiganten")
    ]
//    let storeViewModel = StoreViewModel()
    
    
    CreateProjectSheetView(
        newProjectName: $newProjectName,
        newProjectDescription: $newProjectDescription,
        selectedStore: $selectedStore,
        storeViewModel: StoreViewModel(),
        onSave: {}
    )
    .preferredColorScheme(.dark)
}
