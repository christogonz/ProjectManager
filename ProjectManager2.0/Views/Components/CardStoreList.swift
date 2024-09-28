//
//  CardStoreList.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-28.
//

import SwiftUI

struct CardStoreList: View {
    var name: String = "Elgiganten Barkarby"
    var location: String = "Barkarby"
    let onRemove: () -> Void  // Callback para eliminar la tienda
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            // Tarjeta de la tienda
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color("Card Background"))
                .shadow(color: Color("Card Shadow"), radius: 40, x: 0, y: 20)
                .overlay {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(.white.opacity(0.1), lineWidth: 1)
                }
            
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                
                // Botón para eliminar la tienda
                Button(action: {
                    showAlert = true
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                        .padding()
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Delete Store"),
                        message: Text("Are you sure you want to delete this store?"),
                        primaryButton: .destructive(Text("Delete")) {
                            onRemove()  // Llamada a la función de eliminación
                        },
                        secondaryButton: .cancel()
                    )
                }
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
//        .padding(10)
        
    }
}

#Preview {
    CardStoreList(onRemove: {})
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
}
