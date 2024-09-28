//
//  MultipleSelectionRow.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-17.
//

import SwiftUI

struct MultipleSelectionRow: View {
    var store: Store
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Text(store.name)
                    .foregroundStyle(.white)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                }
            }
        })
    }
}

#Preview {
    MultipleSelectionRow(
        store: Store(name: "Elgiganten Barkarby", locations: "Barkarby", chain: "Elgiganten"),
        isSelected: true,
        action: {}
    )
    .preferredColorScheme(.dark)
}
