//
//  CustomButton2.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-28.
//

import SwiftUI

struct CustomButton2: View {
    var title: String = "Elgiganten"
    var backgroundColor: Color = Color("Card Background")
    var titleColor: Color = Color(.white)
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(backgroundColor)
                .shadow(color: Color("Card Shadow"), radius: 40, x: 0, y: 20)
                .overlay {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(.white.opacity(0.1), lineWidth: 1)
                }
            
            VStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(titleColor)
            }
        }
        .frame(width: 105, height: 45)
    }
}

#Preview {
    CustomButton2()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
}
