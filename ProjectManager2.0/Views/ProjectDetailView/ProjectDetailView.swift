//
//  ProjectDetailView.swift
//  ProjectManager2.0
//
//  Created by Christopher Gonzalez on 2024-09-17.
//

import SwiftUI

struct ProjectDetailView: View {
    var project: Project
    @ObservedObject var projectViewModel: ProjectViewModel
    @State private var selectedChain = "Elgiganten"
    
    let storeChain = ["Elgiganten", "Telia", "Tele2", "Telenor", "Tre"]
    
    var body: some View {
        VStack {
            Text(project.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
            
            Text(project.discription)
                .padding(.horizontal, 12)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(storeChain, id: \.self) {
                        chain in
                        Text(chain)
                            .padding()
                            .background(chain == selectedChain ? .blue : .gray.opacity(0.2))
                            .clipShape(.rect(cornerRadius: 8))
                            .foregroundStyle(chain == selectedChain ? .white : .gray)
                            .onTapGesture {
                                selectedChain = chain
                            }
                    }
                }
                .padding(.horizontal)
            }
            
            List {
                ForEach(project.stores.filter {$0.chain == selectedChain}) {store in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(store.name)
                                .font(.headline)
                            
                            Text(store.locations)
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        if store.isCompleted {
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(.green)
                        } else {
                            Image(systemName: "circle")
                                .foregroundStyle(.red)
                        }
                    }
                    .onTapGesture {
                        projectViewModel.toggleStoreCompletion(for: store, in: project)
                    }
                }
                
            }

        }
        
        
    }
}

#Preview {
    
    let exempleStore = [
        Store(name: "Elgigaganten Barkarby", locations: "Stockholm", chain: "Elgiganten", isCompleted: true),
        Store(name: "Elgigaganten Barkarby", locations: "Stockholm", chain: "Elgiganten", isCompleted: true),
        Store(name: "Elgigaganten Barkarby", locations: "Stockholm", chain: "Elgiganten"),
        Store(name: "Telia Täby", locations: "Täby", chain: "Telia"),
        Store(name: "Telia Kista", locations: "Kista", chain: "Telia"),
    ]
    
    let exempleProject = Project(
        name: "Google Tv Streamer",
        discription: "Installera G Tv Stremaer i dessa butiker. DeadLine 23 okt.",
        stores: exempleStore)
    
    let projectViewmodel = ProjectViewModel()
    
    ProjectDetailView(project: exempleProject, projectViewModel: projectViewmodel)
        .preferredColorScheme(.dark)
}
