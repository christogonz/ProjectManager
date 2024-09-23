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
                    Label("All Projects", systemImage: "folder")
                }
            
            AllStoresView()
                .tabItem {
                    Label("All Stores", systemImage: "building.2")
                }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

