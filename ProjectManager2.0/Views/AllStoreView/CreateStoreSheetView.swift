//
//  CreateStoreSheetView.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-18.
//

import SwiftUI

struct CreateStoreSheetView: View {
    @Binding var newStoreName: String
    @Binding var newStoreLocation: String
    @Binding var selectedChain: String
    
    let storeChains = ["Elgiganten", "Telia", "Tele2", "Telenor", "Tre"]
    var onSave: () -> Void
    
    
    var body: some View {
        VStack {
            TextField("Store Name", text: $newStoreName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Location", text: $newStoreLocation)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Picker("Select Chain", selection: $selectedChain) {
                ForEach(storeChains, id: \.self) { chain in
                    Text(chain).tag(chain)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Button(action: {
                onSave()
            }, label: {
                Text("Add Store")
            })
            .padding()
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var newStoreName = ""
    @Previewable @State var newStoreLocation = ""
    @Previewable @State var selectedChain = "Elgiganten"
    
    CreateStoreSheetView(
        newStoreName: $newStoreName,
        newStoreLocation: $newStoreLocation,
        selectedChain: $selectedChain,
        onSave: {}
    )
    .preferredColorScheme(.dark)
}
