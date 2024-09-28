//
//  CustomIconButton.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-28.
//

import SwiftUI

struct CustomIconButton: View {
    var icon: String = "plus"
    
    var body: some View {
        Image(systemName: icon)
            .frame(width: 40, height: 40)
            .background(LinearGradient(colors: [Color("Temperature Ring 1"), Color("Temperature Ring 2")], startPoint: .top, endPoint: .bottom))
            .clipShape(Circle())
            .foregroundStyle(.white)
    }
}

#Preview {
    CustomIconButton()
}
