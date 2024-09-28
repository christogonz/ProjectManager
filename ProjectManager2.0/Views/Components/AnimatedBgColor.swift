//
//  AnimatedBgColor.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-28.
//

import SwiftUI

struct AnimatedBgColor: View {
    @State var start = UnitPoint(x: 0, y: 0)
    @State var end = UnitPoint(x: 5, y: 1)
    
    let colors = [

        Color("Placeholder 1"),
//        Color("Placeholder 2"),
        Color("Background"),
//        Color.blue.opacity(0.8)
        
    ]
    
    let timer = Timer.publish(every: 0.2, on: .main, in: .default).autoconnect()
    
    var body: some View {
        LinearGradient(colors: colors, startPoint: start, endPoint: end)
//            .onReceive(timer, perform: { _ in
//                withAnimation(.easeInOut(duration: 10).repeatForever(autoreverses: true)) {
//                    self.start =  UnitPoint(x: 4, y: 0)
//                    self.end = UnitPoint(x: 0, y: 2)
//                    self.start = UnitPoint(x: -4, y: 20)
//                    self.end = UnitPoint(x: 4, y: 0)
//                }
//            }
//            )
            .ignoresSafeArea()
    }
}

#Preview {
    AnimatedBgColor()
}
