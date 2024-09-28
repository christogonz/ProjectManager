//
//  ContentView.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AllProjectsView()
                .tabItem {
                    VStack {
                        Image(systemName: "folder")
                        Text("All Projects")
                    }
                    
//                    Label("All Projects", systemImage: "folder")
                }
            
            AllStoresView()
                .tabItem {
                    Label("All Stores", systemImage: "building.2")
                }
        }
        .background(.thinMaterial)
        
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

